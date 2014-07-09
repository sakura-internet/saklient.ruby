# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. ストレージの操作に失敗しました. サーバが混雑している可能性があります.
      class StorageOperationFailureException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。ストレージの操作に失敗しました。サーバが混雑している可能性があります。'

      end

    end
  end
end
