# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. アカウント数上限により作成失敗しました.
      class LimitCountInMemberException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求を受け付けできません。アカウント数上限により作成失敗しました。'

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, message)
        end

      end

    end
  end
end
