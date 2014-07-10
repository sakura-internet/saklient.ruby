# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ライセンスの問題により, 組み合わせて使用できないディスクが接続されています.
      class DiskLicenseMismatchException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ライセンスの問題により、組み合わせて使用できないディスクが接続されています。'

      end

    end
  end
end
