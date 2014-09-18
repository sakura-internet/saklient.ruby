# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. 旧ストレージディスクの提供は終了しました. サーバから該当するディスクを取り外した後, 再度お試しください.
      class OldStoragePlanException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。旧ストレージディスクの提供は終了しました。サーバから該当するディスクを取り外した後、再度お試しください。'

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
