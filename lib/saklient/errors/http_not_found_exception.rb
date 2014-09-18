# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # 対象が見つかりません. 対象は利用できない状態か, IDまたはパスに誤りがあります.
    class HttpNotFoundException < Saklient::Errors::HttpException

      # (static var) @@default_message = '対象が見つかりません。対象は利用できない状態か、IDまたはパスに誤りがあります。'

      # @param [Fixnum] status
      # @param [String] code
      # @param [String] message
      def initialize(status, code = nil, message = '')
        super(status, code, message)
      end

    end

  end
end
