# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. ConnectedなIPv6ネットワークが既に割り当て済みです.
      class IpV6NetAlreadyAttachedException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ConnectedなIPv6ネットワークが既に割り当て済みです。'

      end

    end
  end
end
