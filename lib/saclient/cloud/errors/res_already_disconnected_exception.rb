# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. このリソースは既に切断されています.
      class ResAlreadyDisconnectedException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。このリソースは既に切断されています。'

      end

    end
  end
end
