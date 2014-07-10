# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Unprocessable Entity.
      class HttpUnprocessableEntityException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Unprocessable Entity.'

      end

    end
  end
end
