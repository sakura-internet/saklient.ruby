# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Proxy Authentication Required.
    class HttpProxyAuthenticationRequiredException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Proxy Authentication Required.'

    end

  end
end