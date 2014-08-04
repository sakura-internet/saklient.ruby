# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. アカウント数上限により作成失敗しました.
      class LimitCountInMemberException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求を受け付けできません。アカウント数上限により作成失敗しました。'

      end

    end
  end
end
