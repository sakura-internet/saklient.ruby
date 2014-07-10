# -*- encoding: UTF-8 -*-

require_relative 'http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # 要求を受け付けできません. 契約コードを発行することができません. メンテナンス情報, サポートサイトをご確認ください.
      class ContractCreationException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = '要求を受け付けできません。契約コードを発行することができません。メンテナンス情報、サポートサイトをご確認ください。'

      end

    end
  end
end
