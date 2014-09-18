# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. サーバの操作に失敗しました. このエラーが繰り返し発生する場合は, メンテナンス情報, サポートサイトをご確認ください.
      class HostOperationFailureException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバの操作に失敗しました。このエラーが繰り返し発生する場合は、メンテナンス情報、サポートサイトをご確認ください。'

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
