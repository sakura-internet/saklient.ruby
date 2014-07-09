# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. サーバの操作に失敗しました. このエラーが繰り返し発生する場合は, メンテナンス情報, サポートサイトをご確認ください.
      class HostOperationFailureException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバの操作に失敗しました。このエラーが繰り返し発生する場合は、メンテナンス情報、サポートサイトをご確認ください。'

      end

    end
  end
end
