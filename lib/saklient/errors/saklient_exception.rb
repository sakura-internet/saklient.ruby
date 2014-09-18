# -*- encoding: UTF-8 -*-


module Saklient
  module Errors

    class SaklientException < StandardError

      # @return [String]
      attr_accessor :code

      # @param [String] code
      # @param [String] message
      def initialize(code = nil, message = '')
        super(message)
        @code = code
      end

    end

  end
end
