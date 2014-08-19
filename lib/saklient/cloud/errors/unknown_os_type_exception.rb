# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_service_unavailable_exception'

module Saklient
  module Cloud
    module Errors

      # サービスが利用できません. ディスクにインストールされたOSが特定できないため, 正しく修正できません.
      class UnknownOsTypeException < Saklient::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。ディスクにインストールされたOSが特定できないため、正しく修正できません。'

      end

    end
  end
end
