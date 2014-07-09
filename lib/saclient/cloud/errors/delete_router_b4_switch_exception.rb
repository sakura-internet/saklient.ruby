# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ルータを削除することでスイッチは同時に削除されます.
      class DeleteRouterB4SwitchException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ルータを削除することでスイッチは同時に削除されます。'

      end

    end
  end
end
