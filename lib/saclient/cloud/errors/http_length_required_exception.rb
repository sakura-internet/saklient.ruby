# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Length Required.
      class HttpLengthRequiredException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Length Required.'

      end

    end
  end
end
