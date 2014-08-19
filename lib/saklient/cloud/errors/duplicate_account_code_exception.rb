# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. 同一アカウント名で複数のアカウントを作成することはできません.
      class DuplicateAccountCodeException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。同一アカウント名で複数のアカウントを作成することはできません。'

      end

    end
  end
end
