# frozen_string_literal: true

module OnStrum
  module Healthcheck
    class Resolver
      require 'rack'
      require 'securerandom'
      require 'json'

      PROBE_ENDPOINTS = %i[endpoint_startup endpoint_liveness endpoint_readiness].freeze
      CONTENT_TYPE = { 'Content-Type' => 'application/json' }.freeze
      JSONAPI_RESPONSE_TYPE = 'application-healthcheck'
      ROOT_NAMESPACE = '/'

      def self.call(rack_env)
        new(rack_env).call
      end

      def initialize(rack_env)
        @request = ::Rack::Request.new(rack_env)
      end

      def call
        return unless probe_name

        [response_status, OnStrum::Healthcheck::Resolver::CONTENT_TYPE, [response_jsonapi]]
      end

      private

      attr_reader :request

      def configuration
        OnStrum::Healthcheck.configuration
      end

      def root_namespace
        @root_namespace ||= configuration.endpoints_namespace
      end

      def root_namespace?
        root_namespace.eql?(OnStrum::Healthcheck::Resolver::ROOT_NAMESPACE)
      end

      OnStrum::Healthcheck::Resolver::PROBE_ENDPOINTS.each do |method|
        define_method(method) do
          target_endpoint = configuration.public_send(method)
          root_namespace? ? target_endpoint : "#{root_namespace}#{target_endpoint}"
        end
      end

      def probe_name
        @probe_name ||=
          case request.path
          when endpoint_startup then :startup
          when endpoint_liveness then :liveness
          when endpoint_readiness then :readiness
          end
      end

      def probe_result
        @probe_result ||=
          configuration.public_send(:"services_#{probe_name}").each_with_object({}) do |service_name, response|
            response[service_name] = configuration.services[service_name].call
          end
      end

      def response_status
        configuration.public_send(
          probe_result.values.all? ? :"endpoint_#{probe_name}_status_success" : :"endpoint_#{probe_name}_status_failure"
        )
      end

      def response_jsonapi
        {
          data: {
            id: ::SecureRandom.uuid,
            type: OnStrum::Healthcheck::Resolver::JSONAPI_RESPONSE_TYPE,
            attributes: probe_result
          }
        }.to_json
      end
    end
  end
end
