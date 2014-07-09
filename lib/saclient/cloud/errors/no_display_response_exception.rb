# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. サーバの画面が応答していません.
      class NoDisplayResponseException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバの画面が応答していません。'

      end

    end
  end
end
