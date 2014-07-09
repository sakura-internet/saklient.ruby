# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ISOイメージをサーバから排出後に実行してください.
      class CdromInUseException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ISOイメージをサーバから排出後に実行してください。'

      end

    end
  end
end
