# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. 同一ユーザ名で複数のユーザを作成することはできません.
      class DuplicateUserCodeException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。同一ユーザ名で複数のユーザを作成することはできません。'

      end

    end
  end
end
