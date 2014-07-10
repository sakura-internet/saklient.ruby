# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Insufficient Storage.
      class HttpInsufficientStorageException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Insufficient Storage.'

      end

    end
  end
end
