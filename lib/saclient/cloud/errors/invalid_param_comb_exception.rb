# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 同時に指定できないパラメータが含まれています.
      class InvalidParamCombException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。同時に指定できないパラメータが含まれています。'

      end

    end
  end
end
