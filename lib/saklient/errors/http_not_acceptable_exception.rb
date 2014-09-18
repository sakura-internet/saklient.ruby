# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # 要求を受け付けできません. サポートサイトやメンテナンス情報をご確認ください.
    class HttpNotAcceptableException < Saklient::Errors::HttpException

      # (static var) @@default_message = '要求を受け付けできません。サポートサイトやメンテナンス情報をご確認ください。'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
