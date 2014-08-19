# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_bad_request_exception'

module Saklient
  module Cloud
    module Errors

      # 不適切な要求です. 同時に指定できないパラメータが含まれています.
      class InvalidParamCombException < Saklient::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。同時に指定できないパラメータが含まれています。'

      end

    end
  end
end
