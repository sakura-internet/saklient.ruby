# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Gone.
    class HttpGoneException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Gone.'

    end

  end
end
