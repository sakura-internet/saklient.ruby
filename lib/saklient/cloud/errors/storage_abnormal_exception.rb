# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. ストレージが問題が発生している可能性があります. このエラーが繰り返し発生する場合は, メンテナンス情報, サポートサイトをご確認ください.
      class StorageAbnormalException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。ストレージが問題が発生している可能性があります。このエラーが繰り返し発生する場合は、メンテナンス情報、サポートサイトをご確認ください。'

      end

    end
  end
end
