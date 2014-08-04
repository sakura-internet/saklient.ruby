# -*- encoding: UTF-8 -*-


module Saclient
  module Errors

    class SaclientException < StandardError

      # @return [String]
      attr_accessor :code

      # @return [String]
      attr_accessor :message

      # @param [String] message
      # @param [String] code
      def initialize(code = nil, message = '')
        super(message)
        @code = code
        @message = message
      end

    end

  end
end
