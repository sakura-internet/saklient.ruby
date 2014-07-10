# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Failed Dependency.
      class HttpFailedDependencyException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Failed Dependency.'

      end

    end
  end
end
