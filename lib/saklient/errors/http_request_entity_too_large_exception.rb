# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Request Entity Too Large.
    class HttpRequestEntityTooLargeException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Request Entity Too Large.'

    end

  end
end
