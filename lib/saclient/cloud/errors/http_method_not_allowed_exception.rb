# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求されたHTTPメソッドは対応していません.
      class HttpMethodNotAllowedException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = '要求されたHTTPメソッドは対応していません。'

      end

    end
  end
end
