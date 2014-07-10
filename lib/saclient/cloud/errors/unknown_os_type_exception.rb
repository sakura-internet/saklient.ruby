# -*- encoding: UTF-8 -*-

require_relative 'http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. ディスクにインストールされたOSが特定できないため, 正しく修正できません.
      class UnknownOsTypeException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。ディスクにインストールされたOSが特定できないため、正しく修正できません。'

      end

    end
  end
end
