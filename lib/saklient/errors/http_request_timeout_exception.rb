# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Request Timeout.
    class HttpRequestTimeoutException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Request Timeout.'

    end

  end
end
