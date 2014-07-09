# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. このストレージには指定リソースの複製が既に存在します.
      class ReplicaAlreadyExistsException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。このストレージには指定リソースの複製が既に存在します。'

      end

    end
  end
end
