# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Precondition Failed.
    class HttpPreconditionFailedException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Precondition Failed.'

    end

  end
end
