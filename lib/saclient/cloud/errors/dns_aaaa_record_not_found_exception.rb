# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 対応するAAAAレコードが見つかりません.
      class DnsAaaaRecordNotFoundException < Saclient::Cloud::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。対応するAAAAレコードが見つかりません。'

      end

    end
  end
end
