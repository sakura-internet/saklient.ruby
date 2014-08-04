# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_bad_request_exception'

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 参照するリソースは同一ゾーンに存在しなければなりません.
      class MustBeOfSameZoneException < Saclient::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。参照するリソースは同一ゾーンに存在しなければなりません。'

      end

    end
  end
end
