# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Request Uri Too Long.
      class HttpRequestUriTooLongException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Request Uri Too Long.'

      end

    end
  end
end
