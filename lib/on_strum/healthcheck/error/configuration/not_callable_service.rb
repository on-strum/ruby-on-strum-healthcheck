# frozen_string_literal: true

module OnStrum
  module Healthcheck
    module Error
      module Configuration
        NotCallableService = ::Class.new(::ArgumentError) do
          def initialize(service_name, services_setter)
            super("Service #{service_name} is not callable. All values for #{services_setter} should be a callable objects")
          end
        end
      end
    end
  end
end
