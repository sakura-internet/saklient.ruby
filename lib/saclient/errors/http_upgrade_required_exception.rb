# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Upgrade Required.
    class HttpUpgradeRequiredException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Upgrade Required.'

    end

  end
end
