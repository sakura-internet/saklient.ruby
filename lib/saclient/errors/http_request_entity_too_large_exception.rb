# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Request Entity Too Large.
    class HttpRequestEntityTooLargeException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Request Entity Too Large.'

    end

  end
end
