# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. サーバが混雑しています. しばらく時間をおいてから再度お試しください.
      class BusyException < Saklient::Errors::HttpServiceUnavailableException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? 'サービスが利用できません。サーバが混雑しています。しばらく時間をおいてから再度お試しください。' : message)
        end

      end

    end
  end
end
