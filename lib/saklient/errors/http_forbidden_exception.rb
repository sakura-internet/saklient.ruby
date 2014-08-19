# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # 要求された操作は許可されていません. 権限エラー.
    class HttpForbiddenException < Saklient::Errors::HttpException

      # (static var) @@default_message = '要求された操作は許可されていません。権限エラー。'

    end

  end
end
