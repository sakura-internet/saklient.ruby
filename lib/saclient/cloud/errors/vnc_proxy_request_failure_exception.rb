# -*- encoding: UTF-8 -*-

require_relative 'http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. VNCプロクシの要求に失敗しました.
      class VncProxyRequestFailureException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。VNCプロクシの要求に失敗しました。'

      end

    end
  end
end
