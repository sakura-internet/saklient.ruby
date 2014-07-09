# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. 現在のアカウントで使用している全てのリソースを削除した後に実行してください.
      class DeleteResB4AccountException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。現在のアカウントで使用している全てのリソースを削除した後に実行してください。'

      end

    end
  end
end
