# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_bad_request_exception'

module Saclient
  module Cloud
    module Errors

      # 不適切な要求です. 対応するAレコードが見つかりません.
      class DnsARecordNotFoundException < Saclient::Errors::HttpBadRequestException

        # (static var) @@default_message = '不適切な要求です。対応するAレコードが見つかりません。'

      end

    end
  end
end
