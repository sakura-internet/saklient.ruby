# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. このリソースは他のリソースと既に接続されています.
      class ResAlreadyConnectedException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。このリソースは他のリソースと既に接続されています。'

      end

    end
  end
end
