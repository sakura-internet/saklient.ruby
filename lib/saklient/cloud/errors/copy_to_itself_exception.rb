# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_bad_request_exception'

module Saklient
  module Cloud
    module Errors

      # 不適切な要求です. 自分自身をソースとするコピーはできません.
      class CopyToItselfException < Saklient::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。自分自身をソースとするコピーはできません。'

      end

    end
  end
end
