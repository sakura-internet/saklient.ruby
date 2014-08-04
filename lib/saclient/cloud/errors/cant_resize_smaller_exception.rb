# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_bad_request_exception'

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 現在の容量よりも小さくリサイズすることはできません.
      class CantResizeSmallerException < Saclient::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。現在の容量よりも小さくリサイズすることはできません。'

      end

    end
  end
end
