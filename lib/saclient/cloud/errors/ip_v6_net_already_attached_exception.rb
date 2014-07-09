# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ConnectedなIPv6ネットワークが既に割り当て済みです.
      class IpV6NetAlreadyAttachedException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ConnectedなIPv6ネットワークが既に割り当て済みです。'

      end

    end
  end
end
