# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. DASの利用方法に問題があります. 1台のサーバには同一のストレージ上にあるDASのみを接続できます.
      class IllegalDasUsageException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。DASの利用方法に問題があります。1台のサーバには同一のストレージ上にあるDASのみを接続できます。'

      end

    end
  end
end
