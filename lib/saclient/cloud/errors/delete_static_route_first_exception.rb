# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. ルータを削除する前に, スタティックルートを削除してください.
      class DeleteStaticRouteFirstException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ルータを削除する前に、スタティックルートを削除してください。'

      end

    end
  end
end
