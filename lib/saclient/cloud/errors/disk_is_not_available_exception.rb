# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ディスクが利用可能な状態ではありません. コピー処理等の完了後に再度お試しください.
      class DiskIsNotAvailableException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ディスクが利用可能な状態ではありません。コピー処理等の完了後に再度お試しください。'

      end

    end
  end
end
