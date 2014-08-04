# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # サーバ内部エラーが発生しました. このエラーが繰り返し発生する場合は, メンテナンス情報, サポートサイトをご確認ください.
    class HttpInternalServerErrorException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'サーバ内部エラーが発生しました。このエラーが繰り返し発生する場合は、メンテナンス情報、サポートサイトをご確認ください。'

    end

  end
end
