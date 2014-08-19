# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_forbidden_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作は許可されていません. APIキーによるアクセスはできません.
      class AccessApiKeyDisabledException < Saklient::Errors::HttpForbiddenException

        # (static var) @@default_message = '要求された操作は許可されていません。APIキーによるアクセスはできません。'

      end

    end
  end
end
