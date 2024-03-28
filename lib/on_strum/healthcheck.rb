# frozen_string_literal: true

require_relative 'healthcheck/core'

module OnStrum
  module Healthcheck
    class << self
      def configuration(&block)
        @configuration ||= begin
          return unless block

          OnStrum::Healthcheck::Configuration.new(&block)
        end
      end

      def configure(&block)
        return configuration {} unless block # rubocop:disable Lint/EmptyBlock

        configuration(&block)
      end

      def reset_configuration!
        @configuration = nil
      end
    end
  end
end
