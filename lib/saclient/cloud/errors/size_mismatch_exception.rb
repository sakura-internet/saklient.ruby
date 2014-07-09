# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 参照するリソースのサイズが合致しません.
      class SizeMismatchException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。参照するリソースのサイズが合致しません。'

      end

    end
  end
end
