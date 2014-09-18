# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. この機能は一時的に利用できない状態にあります. メンテナンス情報, サポートサイトをご確認ください.
      class ServiceTemporarilyUnavailableException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。この機能は一時的に利用できない状態にあります。メンテナンス情報、サポートサイトをご確認ください。'

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
