# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Request Timeout.
      class HttpRequestTimeoutException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Request Timeout.'

      end

    end
  end
end
