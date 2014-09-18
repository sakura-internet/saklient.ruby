# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. 同一ゾーン内の他のリソースが既にこのリソースを使用中です.
      class ResUsedInZoneException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。同一ゾーン内の他のリソースが既にこのリソースを使用中です。'

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
