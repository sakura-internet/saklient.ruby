# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. このISOイメージは不完全です. 複製処理等の完了後に再度お試しください.
      class CdromIsIncompleteException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。このISOイメージは不完全です。複製処理等の完了後に再度お試しください。'

      end

    end
  end
end
