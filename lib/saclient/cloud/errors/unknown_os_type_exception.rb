# -*- encoding: UTF-8 -*-

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
