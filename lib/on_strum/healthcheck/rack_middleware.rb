# frozen_string_literal: true

module OnStrum
  module Healthcheck
    class RackMiddleware
      def initialize(app, resolver = OnStrum::Healthcheck::Resolver, *_args)
        @app = app
        @resolver = resolver
      end

      def call(env)
        resolver.call(env) || app.call(env)
      end

      private

      attr_reader :app, :resolver
    end
  end
end
