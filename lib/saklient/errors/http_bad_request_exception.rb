# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # 不適切な要求です. パラメータの指定誤り, 入力規則違反です. 入力内容をご確認ください.
    class HttpBadRequestException < Saklient::Errors::HttpException

      # (static var) @@default_message = '不適切な要求です。パラメータの指定誤り、入力規則違反です。入力内容をご確認ください。'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
