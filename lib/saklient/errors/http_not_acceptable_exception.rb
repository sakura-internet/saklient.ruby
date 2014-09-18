# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # 要求を受け付けできません. サポートサイトやメンテナンス情報をご確認ください.
    class HttpNotAcceptableException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? '要求を受け付けできません。サポートサイトやメンテナンス情報をご確認ください。' : message)
      end

    end

  end
end
