# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Request Entity Too Large.
      class HttpRequestEntityTooLargeException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Request Entity Too Large.'

      end

    end
  end
end
