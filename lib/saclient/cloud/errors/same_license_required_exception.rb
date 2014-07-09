# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. 再インストール時に指定できるソースは, 同一のライセンスを必要とするアーカイブに限られます.
      class SameLicenseRequiredException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。再インストール時に指定できるソースは、同一のライセンスを必要とするアーカイブに限られます。'

      end

    end
  end
end
