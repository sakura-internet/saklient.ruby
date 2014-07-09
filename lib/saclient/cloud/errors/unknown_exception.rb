# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 予期しないエラーが発生しました. このエラーが繰り返し発生する場合は, サポートサイトやメンテナンス情報をご確認ください.
      class UnknownException < Saclient::Cloud::Errors::HttpInternalServerErrorException

        # (static var) @@default_message = '予期しないエラーが発生しました。このエラーが繰り返し発生する場合は、サポートサイトやメンテナンス情報をご確認ください。'

      end

    end
  end
end
