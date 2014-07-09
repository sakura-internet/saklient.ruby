# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. フィールドの型に対応していない演算子がフィルタ中に含まれています.
      class FilterBadOperatorException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。フィールドの型に対応していない演算子がフィルタ中に含まれています。'

      end

    end
  end
end
