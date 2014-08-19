# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Locked.
    class HttpLockedException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Locked.'

    end

  end
end
