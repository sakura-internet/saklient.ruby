# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Bad Gateway.
    class HttpBadGatewayException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Bad Gateway.'

    end

  end
end
