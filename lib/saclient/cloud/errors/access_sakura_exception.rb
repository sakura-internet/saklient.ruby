# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. さくらインターネットの会員メニューより認証後に実行してください.
      class AccessSakuraException < Saclient::Cloud::Errors::HttpForbiddenException

        # (static var) @@default_message = '要求された操作は許可されていません。さくらインターネットの会員メニューより認証後に実行してください。'

      end

    end
  end
end
