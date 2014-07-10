# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Locked.
      class HttpLockedException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Locked.'

      end

    end
  end
end
