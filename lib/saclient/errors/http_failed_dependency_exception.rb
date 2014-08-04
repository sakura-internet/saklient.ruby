# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # HTTPエラー. Failed Dependency.
    class HttpFailedDependencyException < Saclient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Failed Dependency.'

    end

  end
end
