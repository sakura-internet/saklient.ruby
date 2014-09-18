# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求を受け付けできません. ルータあたりのリソース数上限により, リソースの割り当てに失敗しました.
      class LimitCountInRouterException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求を受け付けできません。ルータあたりのリソース数上限により、リソースの割り当てに失敗しました。' : message)
        end

      end

    end
  end
end
