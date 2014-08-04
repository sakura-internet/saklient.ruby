# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. リソースが既に存在するか, リソース同士が既に関連付けられています.
      class DuplicateEntryException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。リソースが既に存在するか、リソース同士が既に関連付けられています。'

      end

    end
  end
end
