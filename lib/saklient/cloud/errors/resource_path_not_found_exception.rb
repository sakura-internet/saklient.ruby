# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_not_found_exception'

module Saklient
  module Cloud
    module Errors

      # 対象が見つかりません. パスに誤りがあります.
      class ResourcePathNotFoundException < Saklient::Errors::HttpNotFoundException

        # (static var) @@default_message = '対象が見つかりません。パスに誤りがあります。'

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, message)
        end

      end

    end
  end
end
