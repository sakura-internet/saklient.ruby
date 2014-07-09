# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. リクエストの密度が高すぎます.
      class TooManyRequestException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = '要求を受け付けできません。リクエストの密度が高すぎます。'

      end

    end
  end
end
