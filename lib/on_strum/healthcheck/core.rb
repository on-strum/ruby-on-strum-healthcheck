# frozen_string_literal: true

module OnStrum
  module Healthcheck
    module Error
      module Configuration
        require_relative 'error/configuration/argument_type'
        require_relative 'error/configuration/unknown_service'
        require_relative 'error/configuration/not_callable_service'
        require_relative 'error/configuration/enpoint_pattern'
        require_relative 'error/configuration/http_status_success'
        require_relative 'error/configuration/http_status_failure'
      end
    end

    require_relative 'version'
    require_relative 'configuration'
  end
end
