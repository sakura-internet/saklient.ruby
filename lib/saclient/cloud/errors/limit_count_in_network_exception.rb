# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. ネットワーク内リソース数上限により, リソースの割り当てに失敗しました.
      class LimitCountInNetworkException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求を受け付けできません。ネットワーク内リソース数上限により、リソースの割り当てに失敗しました。'

      end

    end
  end
end
