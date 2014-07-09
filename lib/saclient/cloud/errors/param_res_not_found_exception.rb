# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. パラメータで指定されたリソースが存在しません. IDをご確認ください.
      class ParamResNotFoundException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。パラメータで指定されたリソースが存在しません。IDをご確認ください。'

      end

    end
  end
end
