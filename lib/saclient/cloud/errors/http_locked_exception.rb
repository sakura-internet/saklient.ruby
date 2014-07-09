# -*- encoding: UTF-8 -*-

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
