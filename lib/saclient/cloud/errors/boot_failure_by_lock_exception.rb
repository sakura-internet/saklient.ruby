# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. サーバが予期せず終了したため, ロックされています. しばらく時間をおいてから再度お試しください.
      class BootFailureByLockException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバが予期せず終了したため、ロックされています。しばらく時間をおいてから再度お試しください。'

      end

    end
  end
end
