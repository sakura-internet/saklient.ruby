# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # サーバ内部エラーが発生しました. このエラーが繰り返し発生する場合は, メンテナンス情報, サポートサイトをご確認ください.
    class HttpInternalServerErrorException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? 'サーバ内部エラーが発生しました。このエラーが繰り返し発生する場合は、メンテナンス情報、サポートサイトをご確認ください。' : message)
      end

    end

  end
end
