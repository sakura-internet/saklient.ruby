# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Not Extended.
    class HttpNotExtendedException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Not Extended.'

    end

  end
end
