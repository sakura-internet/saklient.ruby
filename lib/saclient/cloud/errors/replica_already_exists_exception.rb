# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. このストレージには指定リソースの複製が既に存在します.
      class ReplicaAlreadyExistsException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。このストレージには指定リソースの複製が既に存在します。'

      end

    end
  end
end
