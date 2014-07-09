# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ルータを削除する前に, スタティックルートを削除してください.
      class DeleteStaticRouteFirstException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ルータを削除する前に、スタティックルートを削除してください。'

      end

    end
  end
end
