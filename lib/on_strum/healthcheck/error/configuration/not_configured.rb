# frozen_string_literal: true

module OnStrum
  module Healthcheck
    module Error
      module Configuration
        NotConfigured = ::Class.new(::RuntimeError) do
          def initialize
            super('The configuration is empty. Please use OnStrum::Healthcheck.configure before')
          end
        end
      end
    end
  end
end
