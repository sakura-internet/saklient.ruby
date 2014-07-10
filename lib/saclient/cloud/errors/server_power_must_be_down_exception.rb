# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. サーバが起動中にはこの操作を行えません.
      class ServerPowerMustBeDownException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。サーバが起動中にはこの操作を行えません。'

      end

    end
  end
end
