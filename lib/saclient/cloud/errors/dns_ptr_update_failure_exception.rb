# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. PTRレコードを設定できません.
      class DnsPtrUpdateFailureException < Saclient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。PTRレコードを設定できません。'

      end

    end
  end
end
