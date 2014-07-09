# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. このAPIはアカウントを特定できる認証方法でアクセスする必要があります.
      class AccountNotSpecifiedException < Saclient::Cloud::Errors::HttpForbiddenException

        # (static var) @@default_message = '要求された操作は許可されていません。このAPIはアカウントを特定できる認証方法でアクセスする必要があります。'

      end

    end
  end
end
