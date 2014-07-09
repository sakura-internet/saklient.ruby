# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ISOイメージが無効化されています. 排出後に再度お試しください.
      class CdromDisabledException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ISOイメージが無効化されています。排出後に再度お試しください。'

      end

    end
  end
end
