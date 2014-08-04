# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. サーバを停止できません. 再度お試しください.
      class ServerCouldNotStopException < Saclient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバを停止できません。再度お試しください。'

      end

    end
  end
end
