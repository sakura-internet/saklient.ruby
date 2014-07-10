# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Http Version Not Supported.
      class HttpHttpVersionNotSupportedException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Http Version Not Supported.'

      end

    end
  end
end
