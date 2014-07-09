# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. サーバとの接続を切り離した後に実行してください.
      class DisconnectB4DeleteException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。サーバとの接続を切り離した後に実行してください。'

      end

    end
  end
end
