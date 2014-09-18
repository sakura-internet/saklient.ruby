# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_bad_request_exception'

module Saklient
  module Cloud
    module Errors

      # 不適切な要求です. 参照するリソースは同一ゾーンに存在しなければなりません.
      class MustBeOfSameZoneException < Saklient::Errors::HttpBadRequestException

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, (message).nil? || message == '' ? '不適切な要求です。参照するリソースは同一ゾーンに存在しなければなりません。' : message)
        end

      end

    end
  end
end
