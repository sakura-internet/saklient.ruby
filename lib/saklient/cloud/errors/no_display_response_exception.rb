# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. サーバの画面が応答していません.
      class NoDisplayResponseException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバの画面が応答していません。'

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
