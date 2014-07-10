# -*- encoding: UTF-8 -*-

require_relative 'http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. この機能は一時的に利用できない状態にあります. メンテナンス情報, サポートサイトをご確認ください.
      class ServiceTemporarilyUnavailableException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。この機能は一時的に利用できない状態にあります。メンテナンス情報、サポートサイトをご確認ください。'

      end

    end
  end
end
