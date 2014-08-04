# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Gone.
    class HttpGoneException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Gone.'

    end

  end
end
