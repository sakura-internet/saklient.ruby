# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. サーバが混雑しています. しばらく時間をおいてから再度お試しください.
      class BusyException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバが混雑しています。しばらく時間をおいてから再度お試しください。'

      end

    end
  end
end
