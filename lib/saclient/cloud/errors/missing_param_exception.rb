# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 必要なパラメータが指定されていません.
      class MissingParamException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。必要なパラメータが指定されていません。'

      end

    end
  end
end
