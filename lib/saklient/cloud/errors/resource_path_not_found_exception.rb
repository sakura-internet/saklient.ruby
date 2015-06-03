# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/http_not_found_exception'

module Saklient
  module Cloud
    module Errors

      # 対象が見つかりません. パスに誤りがあります.
      class ResourcePathNotFoundException < Saklient::Errors::HttpNotFoundException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '対象が見つかりません。パスに誤りがあります。' : message)
        end

      end

    end
  end
end
