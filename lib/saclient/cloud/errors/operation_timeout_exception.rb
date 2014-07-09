# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. 操作がタイムアウトしました. サーバが混雑している可能性があります.
      class OperationTimeoutException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。操作がタイムアウトしました。サーバが混雑している可能性があります。'

      end

    end
  end
end
