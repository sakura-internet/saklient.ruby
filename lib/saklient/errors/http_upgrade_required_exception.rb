# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Upgrade Required.
    class HttpUpgradeRequiredException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Upgrade Required.'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
