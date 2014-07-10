# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Unsupported Media Type.
      class HttpUnsupportedMediaTypeException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Unsupported Media Type.'

      end

    end
  end
end
