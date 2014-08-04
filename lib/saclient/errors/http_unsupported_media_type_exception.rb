# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Unsupported Media Type.
    class HttpUnsupportedMediaTypeException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Unsupported Media Type.'

    end

  end
end
