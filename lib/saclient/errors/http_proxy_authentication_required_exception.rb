# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Proxy Authentication Required.
    class HttpProxyAuthenticationRequiredException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Proxy Authentication Required.'

    end

  end
end
