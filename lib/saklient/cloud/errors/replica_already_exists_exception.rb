# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. このストレージには指定リソースの複製が既に存在します.
      class ReplicaAlreadyExistsException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。このストレージには指定リソースの複製が既に存在します。' : message)
        end

      end

    end
  end
end
