# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Locked.
    class HttpLockedException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Locked.'

    end

  end
end
