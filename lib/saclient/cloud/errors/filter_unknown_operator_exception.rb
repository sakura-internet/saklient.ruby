# -*- encoding: UTF-8 -*-

require_relative 'http_bad_request_exception'

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 不明な演算子がフィルタ中に含まれています.
      class FilterUnknownOperatorException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。不明な演算子がフィルタ中に含まれています。'

      end

    end
  end
end
