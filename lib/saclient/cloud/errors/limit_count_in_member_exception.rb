# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. アカウント数上限により作成失敗しました.
      class LimitCountInMemberException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求を受け付けできません。アカウント数上限により作成失敗しました。'

      end

    end
  end
end
