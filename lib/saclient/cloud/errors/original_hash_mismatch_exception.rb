# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. オリジナルのデータを取得してからこのリクエストを行うまでの間に, 他の変更が加わった可能性があります.
      class OriginalHashMismatchException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。オリジナルのデータを取得してからこのリクエストを行うまでの間に、他の変更が加わった可能性があります。'

      end

    end
  end
end
