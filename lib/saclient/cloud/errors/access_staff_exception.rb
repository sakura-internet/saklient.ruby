# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_forbidden_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. 権限エラー.
      class AccessStaffException < Saclient::Errors::HttpForbiddenException

        # (static var) @@default_message = '要求された操作は許可されていません。権限エラー。'

      end

    end
  end
end
