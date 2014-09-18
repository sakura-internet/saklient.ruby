# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. リクエストの密度が高すぎます.
      class TooManyRequestException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = '要求を受け付けできません。リクエストの密度が高すぎます。'

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, message)
        end

      end

    end
  end
end
