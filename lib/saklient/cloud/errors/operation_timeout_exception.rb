# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. 操作がタイムアウトしました. サーバが混雑している可能性があります.
      class OperationTimeoutException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。操作がタイムアウトしました。サーバが混雑している可能性があります。'

      end

    end
  end
end
