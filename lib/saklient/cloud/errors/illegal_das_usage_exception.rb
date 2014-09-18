# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. DASの利用方法に問題があります. 1台のサーバには同一のストレージ上にあるDASのみを接続できます.
      class IllegalDasUsageException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。DASの利用方法に問題があります。1台のサーバには同一のストレージ上にあるDASのみを接続できます。' : message)
        end

      end

    end
  end
end
