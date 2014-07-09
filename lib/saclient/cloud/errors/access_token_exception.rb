# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. この操作は有効期限内のトークンが必要です.
      class AccessTokenException < Saclient::Cloud::Errors::HttpForbiddenException

        # (static var) @@default_message = '要求された操作は許可されていません。この操作は有効期限内のトークンが必要です。'

      end

    end
  end
end
