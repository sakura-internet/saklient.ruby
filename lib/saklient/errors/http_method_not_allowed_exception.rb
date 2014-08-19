# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # 要求されたHTTPメソッドは対応していません.
    class HttpMethodNotAllowedException < Saklient::Errors::HttpException

      # (static var) @@default_message = '要求されたHTTPメソッドは対応していません。'

    end

  end
end
