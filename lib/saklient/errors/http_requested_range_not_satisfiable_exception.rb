# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Requested Range Not Satisfiable.
    class HttpRequestedRangeNotSatisfiableException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? 'HTTPエラー。Requested Range Not Satisfiable.' : message)
      end

    end

  end
end
