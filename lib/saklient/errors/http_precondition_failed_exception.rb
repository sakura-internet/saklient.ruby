# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Precondition Failed.
    class HttpPreconditionFailedException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Precondition Failed.'

    end

  end
end
