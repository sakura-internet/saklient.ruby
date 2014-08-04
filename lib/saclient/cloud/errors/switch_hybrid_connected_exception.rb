# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ハイブリッド接続されているスイッチに対して, この操作はできません.
      class SwitchHybridConnectedException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ハイブリッド接続されているスイッチに対して、この操作はできません。'

      end

    end
  end
end
