# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. アカウントあたりのリソース数上限により, リソースの割り当てに失敗しました.
      class LimitCountInAccountException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求を受け付けできません。アカウントあたりのリソース数上限により、リソースの割り当てに失敗しました。'

      end

    end
  end
end
