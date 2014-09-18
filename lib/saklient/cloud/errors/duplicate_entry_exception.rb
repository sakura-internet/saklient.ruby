# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. リソースが既に存在するか, リソース同士が既に関連付けられています.
      class DuplicateEntryException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。リソースが既に存在するか、リソース同士が既に関連付けられています。' : message)
        end

      end

    end
  end
end
