# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. 作成済みディスクを確保できませんでした. サーバが混雑している可能性があります.
      class DiskStockRunOutException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。作成済みディスクを確保できませんでした。サーバが混雑している可能性があります。'

      end

    end
  end
end