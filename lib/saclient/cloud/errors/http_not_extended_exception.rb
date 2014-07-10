# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Not Extended.
      class HttpNotExtendedException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Not Extended.'

      end

    end
  end
end
