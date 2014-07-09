# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. 旧ストレージディスクの提供は終了しました. サーバから該当するディスクを取り外した後, 再度お試しください.
      class OldStoragePlanException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。旧ストレージディスクの提供は終了しました。サーバから該当するディスクを取り外した後、再度お試しください。'

      end

    end
  end
end
