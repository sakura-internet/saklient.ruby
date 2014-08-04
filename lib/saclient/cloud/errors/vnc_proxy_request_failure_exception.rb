# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. VNCプロクシの要求に失敗しました.
      class VncProxyRequestFailureException < Saclient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。VNCプロクシの要求に失敗しました。'

      end

    end
  end
end
