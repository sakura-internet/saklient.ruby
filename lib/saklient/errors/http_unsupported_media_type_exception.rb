# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Unsupported Media Type.
    class HttpUnsupportedMediaTypeException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Unsupported Media Type.'

    end

  end
end
