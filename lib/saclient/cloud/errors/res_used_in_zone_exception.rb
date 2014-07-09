# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. 同一ゾーン内の他のリソースが既にこのリソースを使用中です.
      class ResUsedInZoneException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。同一ゾーン内の他のリソースが既にこのリソースを使用中です。'

      end

    end
  end
end
