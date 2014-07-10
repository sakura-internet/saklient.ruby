# -*- encoding: UTF-8 -*-

require_relative 'http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. PTRレコードを設定できません.
      class DnsPtrUpdateFailureException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。PTRレコードを設定できません。'

      end

    end
  end
end
