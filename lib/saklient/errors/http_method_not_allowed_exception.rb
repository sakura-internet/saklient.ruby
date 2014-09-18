# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # 要求されたHTTPメソッドは対応していません.
    class HttpMethodNotAllowedException < Saklient::Errors::HttpException

      # (static var) @@default_message = '要求されたHTTPメソッドは対応していません。'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
