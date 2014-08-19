# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Request Uri Too Long.
    class HttpRequestUriTooLongException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Request Uri Too Long.'

    end

  end
end
