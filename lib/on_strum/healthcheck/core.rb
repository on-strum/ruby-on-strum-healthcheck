# frozen_string_literal: true

module OnStrum
  module Healthcheck
    module Error
      require_relative 'error/argument_type'
      require_relative 'error/unknown_service'
    end

    require_relative 'version'
  end
end
