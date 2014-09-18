# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. ルータを削除することでスイッチは同時に削除されます.
      class DeleteRouterB4SwitchException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。ルータを削除することでスイッチは同時に削除されます。' : message)
        end

      end

    end
  end
end
