# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. サーバと接続された状態では変更できない値が含まれています.
      class DisconnectB4UpdateException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。サーバと接続された状態では変更できない値が含まれています。'

      end

    end
  end
end
