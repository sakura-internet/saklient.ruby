# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. 複数のインタフェースから同一のスイッチに接続することはできません.
      class ConnectToSameSwitchException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。複数のインタフェースから同一のスイッチに接続することはできません。'

      end

    end
  end
end
