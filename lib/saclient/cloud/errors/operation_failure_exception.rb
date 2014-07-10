# -*- encoding: UTF-8 -*-

require_relative 'http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. 操作に失敗しました. サーバが混雑している可能性があります.
      class OperationFailureException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。操作に失敗しました。サーバが混雑している可能性があります。'

      end

    end
  end
end
