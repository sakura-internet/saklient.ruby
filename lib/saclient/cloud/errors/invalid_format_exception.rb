# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_bad_request_exception'

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. パラメータに含まれている値のフォーマットが一部不正です.
      class InvalidFormatException < Saclient::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。パラメータに含まれている値のフォーマットが一部不正です。'

      end

    end
  end
end
