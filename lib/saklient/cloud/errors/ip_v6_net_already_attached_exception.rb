# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. ConnectedなIPv6ネットワークが既に割り当て済みです.
      class IpV6NetAlreadyAttachedException < Saklient::Errors::HttpConflictException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '要求された操作を行えません。ConnectedなIPv6ネットワークが既に割り当て済みです。' : message)
        end

      end

    end
  end
end
