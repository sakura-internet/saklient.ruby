# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. VNCプロクシの要求に失敗しました.
      class VncProxyRequestFailureException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。VNCプロクシの要求に失敗しました。'

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
