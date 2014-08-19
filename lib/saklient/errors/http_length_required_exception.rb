# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Length Required.
    class HttpLengthRequiredException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Length Required.'

    end

  end
end
