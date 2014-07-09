# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. この種類のリソースは要求された操作に対応しません.
      class UnsupportedResClassException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。この種類のリソースは要求された操作に対応しません。'

      end

    end
  end
end
