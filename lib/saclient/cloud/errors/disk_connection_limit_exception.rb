# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. この接続インタフェースにこれ以上のディスクを接続することができません.
      class DiskConnectionLimitException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。この接続インタフェースにこれ以上のディスクを接続することができません。'

      end

    end
  end
end
