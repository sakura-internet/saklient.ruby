# -*- encoding: UTF-8 -*-

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
