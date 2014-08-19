# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. サーバが混雑しています. しばらく時間をおいてから再度お試しください.
      class BusyException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバが混雑しています。しばらく時間をおいてから再度お試しください。'

      end

    end
  end
end
