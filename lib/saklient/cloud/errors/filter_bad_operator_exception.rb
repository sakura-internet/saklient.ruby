# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/http_bad_request_exception'

module Saklient
  module Cloud
    module Errors

      # 不適切な要求です. フィールドの型に対応していない演算子がフィルタ中に含まれています.
      class FilterBadOperatorException < Saklient::Errors::HttpBadRequestException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '不適切な要求です。フィールドの型に対応していない演算子がフィルタ中に含まれています。' : message)
        end

      end

    end
  end
end
