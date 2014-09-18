# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_not_found_exception'

module Saklient
  module Cloud
    module Errors

      # 対象が見つかりません. 識別名から一意にリソースを特定できません.
      class AmbiguousIdentifierException < Saklient::Errors::HttpNotFoundException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '対象が見つかりません。識別名から一意にリソースを特定できません。' : message)
        end

      end

    end
  end
end
