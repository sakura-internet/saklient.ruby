# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # 不適切な要求です. パラメータの指定誤り, 入力規則違反です. 入力内容をご確認ください.
    class HttpBadRequestException < Saclient::Errors::HttpException

      # (static var) @@default_message = '不適切な要求です。パラメータの指定誤り、入力規則違反です。入力内容をご確認ください。'

    end

  end
end
