# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. このストレージ上への指定リソースの複製は実行されていません.
      class NotReplicatingException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。このストレージ上への指定リソースの複製は実行されていません。'

      end

    end
  end
end
