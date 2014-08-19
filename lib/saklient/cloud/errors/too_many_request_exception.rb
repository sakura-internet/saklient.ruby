# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. リクエストの密度が高すぎます.
      class TooManyRequestException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = '要求を受け付けできません。リクエストの密度が高すぎます。'

      end

    end
  end
end
