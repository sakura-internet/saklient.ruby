# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. 権限エラー.
      class AccessStaffException < Saclient::Cloud::Errors::HttpForbiddenException

        # (static var) @@default_message = '要求された操作は許可されていません。権限エラー。'

      end

    end
  end
end
