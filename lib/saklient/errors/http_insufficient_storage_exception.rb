# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Insufficient Storage.
    class HttpInsufficientStorageException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Insufficient Storage.'

    end

  end
end
