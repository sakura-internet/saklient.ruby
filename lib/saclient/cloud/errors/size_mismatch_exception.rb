# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_bad_request_exception'

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 参照するリソースのサイズが合致しません.
      class SizeMismatchException < Saclient::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。参照するリソースのサイズが合致しません。'

      end

    end
  end
end
