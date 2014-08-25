# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_not_found_exception'

module Saklient
  module Cloud
    module Errors

      # 対象が見つかりません. パスに使用できない文字が含まれています.
      class InvalidUriArgumentException < Saklient::Errors::HttpNotFoundException

        # (static var) @@default_message = '対象が見つかりません。パスに使用できない文字が含まれています。'

      end

    end
  end
end