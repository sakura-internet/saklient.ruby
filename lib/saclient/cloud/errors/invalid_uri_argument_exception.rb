# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 対象が見つかりません. パスに使用できない文字が含まれています.
      class InvalidUriArgumentException < Saclient::Cloud::Errors::HttpNotFoundException

        # (static var) @@default_message = '対象が見つかりません。パスに使用できない文字が含まれています。'

      end

    end
  end
end
