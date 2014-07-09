# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. リクエストパラメータに指定されたゾーンをパスに含むURLへアクセスしてください.
      class AmbiguousZoneException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。リクエストパラメータに指定されたゾーンをパスに含むURLへアクセスしてください。'

      end

    end
  end
end
