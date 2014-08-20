# -*- encoding: UTF-8 -*-


module Saklient
  module Errors

    class SaklientException < StandardError

      # @return [String]
      attr_accessor :code

      # @return [String]
      attr_accessor :message

      # @param [String] code
      # @param [String] message
      def initialize(code = nil, message = '')
        super(message)
        @code = code
        @message = message
      end

    end

  end
end
