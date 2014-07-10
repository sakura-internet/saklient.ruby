# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. サーバが終了処理中です. しばらく時間をおいてから再度お試しください.
      class ServerIsCleaningException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。サーバが終了処理中です。しばらく時間をおいてから再度お試しください。'

      end

    end
  end
end
