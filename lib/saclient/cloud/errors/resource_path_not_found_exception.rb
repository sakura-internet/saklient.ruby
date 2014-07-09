# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 対象が見つかりません. パスに誤りがあります.
      class ResourcePathNotFoundException < Saclient::Cloud::Errors::HttpNotFoundException

        # (static var) @@default_message = '対象が見つかりません。パスに誤りがあります。'

      end

    end
  end
end
