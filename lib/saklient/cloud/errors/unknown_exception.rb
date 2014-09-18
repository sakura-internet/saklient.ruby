# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_internal_server_error_exception'

module Saklient
  module Cloud
    module Errors

      # 予期しないエラーが発生しました. このエラーが繰り返し発生する場合は, サポートサイトやメンテナンス情報をご確認ください.
      class UnknownException < Saklient::Errors::HttpInternalServerErrorException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '予期しないエラーが発生しました。このエラーが繰り返し発生する場合は、サポートサイトやメンテナンス情報をご確認ください。' : message)
        end

      end

    end
  end
end
