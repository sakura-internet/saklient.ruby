# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. 契約コードを発行することができません. メンテナンス情報, サポートサイトをご確認ください.
      class ContractCreationException < Saklient::Errors::HttpServiceUnavailableException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求を受け付けできません。契約コードを発行することができません。メンテナンス情報、サポートサイトをご確認ください。' : message)
        end

      end

    end
  end
end
