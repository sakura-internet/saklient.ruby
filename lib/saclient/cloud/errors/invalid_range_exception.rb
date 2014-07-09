# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. パラメータに含まれている値の範囲が一部不正です.
      class InvalidRangeException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。パラメータに含まれている値の範囲が一部不正です。'

      end

    end
  end
end
