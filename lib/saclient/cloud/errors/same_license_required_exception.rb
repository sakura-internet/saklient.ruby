# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. 再インストール時に指定できるソースは, 同一のライセンスを必要とするアーカイブに限られます.
      class SameLicenseRequiredException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。再インストール時に指定できるソースは、同一のライセンスを必要とするアーカイブに限られます。'

      end

    end
  end
end
