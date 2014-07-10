# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. サポートサイトやメンテナンス情報をご確認ください.
      class HttpNotAcceptableException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = '要求を受け付けできません。サポートサイトやメンテナンス情報をご確認ください。'

      end

    end
  end
end
