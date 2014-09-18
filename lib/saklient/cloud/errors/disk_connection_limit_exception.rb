# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. この接続インタフェースにこれ以上のディスクを接続することができません.
      class DiskConnectionLimitException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。この接続インタフェースにこれ以上のディスクを接続することができません。'

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
