# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # 要求されたHTTPメソッドは対応していません.
    class HttpMethodNotAllowedException < Saklient::Errors::HttpException

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, (message).nil? || message == '' ? '要求されたHTTPメソッドは対応していません。' : message)
      end

    end

  end
end
