# frozen_string_literal: true

module OnStrum
  module Healthcheck
    module RspecHelper
      module ContextGenerator
        def random_message
          ::FFaker::Lorem.sentence
        end

        def random_service_name
          ::FFaker::InternetSE.login_user_name
        end
      end
    end
  end
end
