# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. ストレージの操作に失敗しました. サーバが混雑している可能性があります.
      class StorageOperationFailureException < Saclient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。ストレージの操作に失敗しました。サーバが混雑している可能性があります。'

      end

    end
  end
end
