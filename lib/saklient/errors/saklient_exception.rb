# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator


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
