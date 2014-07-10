# -*- encoding: UTF-8 -*-

require_relative 'http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. サーバの操作に失敗しました.
      class ServerOperationFailureException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバの操作に失敗しました。'

      end

    end
  end
end
