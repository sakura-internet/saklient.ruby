# -*- encoding: UTF-8 -*-


module Saklient
  module Errors

    class HttpException < StandardError

      # @return [Fixnum]
      attr_accessor :status

      # @return [String]
      attr_accessor :code

      # @return [String]
      attr_accessor :message

      # @param [String] message
      # @param [Fixnum] status
      # @param [String] code
      def initialize(status, code = nil, message = '')
        super(message)
        @status = status
        @code = code
        @message = message
      end

    end

  end
end
