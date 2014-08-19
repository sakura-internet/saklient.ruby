# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Unprocessable Entity.
    class HttpUnprocessableEntityException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Unprocessable Entity.'

    end

  end
end
