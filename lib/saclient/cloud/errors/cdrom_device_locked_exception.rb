# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. CD-ROMドライブがロックされています.
      class CdromDeviceLockedException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。CD-ROMドライブがロックされています。'

      end

    end
  end
end
