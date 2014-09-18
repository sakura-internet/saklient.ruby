# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. 起動中のサーバが収容されているハイパーバイザとパケットフィルタのバージョンが合致しません. コントロールパネルまたはAPIからの操作によりサーバを一旦停止し, 再度起動後にお試しください.
      class PacketFilterVersionMismatchException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。起動中のサーバが収容されているハイパーバイザとパケットフィルタのバージョンが合致しません。コントロールパネルまたはAPIからの操作によりサーバを一旦停止し、再度起動後にお試しください。' : message)
        end

      end

    end
  end
end
