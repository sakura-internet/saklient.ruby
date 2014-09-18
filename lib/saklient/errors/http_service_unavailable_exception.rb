# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # サービスが利用できません. 対象は利用できない, またはサーバが混雑しています. このエラーが繰り返し発生する場合は, メンテナンス情報, サポートサイトをご確認ください.
    class HttpServiceUnavailableException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? 'サービスが利用できません。対象は利用できない、またはサーバが混雑しています。このエラーが繰り返し発生する場合は、メンテナンス情報、サポートサイトをご確認ください。' : message)
      end

    end

  end
end
