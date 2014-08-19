# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. ハイブリッド接続と併用する場合はお問い合わせください.
      class NotWithHybridconnException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ハイブリッド接続と併用する場合はお問い合わせください。'

      end

    end
  end
end
