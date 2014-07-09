# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 自分自身をソースとするコピーはできません.
      class CopyToItselfException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。自分自身をソースとするコピーはできません。'

      end

    end
  end
end
