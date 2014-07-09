# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. 作成済みディスクを確保できませんでした. サーバが混雑している可能性があります.
      class DiskStockRunOutException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。作成済みディスクを確保できませんでした。サーバが混雑している可能性があります。'

      end

    end
  end
end
