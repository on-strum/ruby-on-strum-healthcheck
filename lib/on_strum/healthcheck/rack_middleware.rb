# frozen_string_literal: true

module OnStrum
  module Healthcheck
    class RackMiddleware
      def initialize(
        app,
        resolver = OnStrum::Healthcheck::Resolver,
        counfigured = !!OnStrum::Healthcheck.configuration,
        *
      )
        @app = app
        @resolver = resolver
        @counfigured = counfigured
      end

      def call(env)
        raise OnStrum::Healthcheck::Error::Configuration::NotConfigured unless counfigured

        resolver.call(env) || app.call(env)
      end

      private

      attr_reader :app, :resolver, :counfigured
    end
  end
end
