# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Not Implemented.
    class HttpNotImplementedException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Not Implemented.'

    end

  end
end
