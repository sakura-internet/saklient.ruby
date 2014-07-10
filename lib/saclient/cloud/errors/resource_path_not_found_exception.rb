# -*- encoding: UTF-8 -*-

require_relative 'http_not_found_exception'

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
