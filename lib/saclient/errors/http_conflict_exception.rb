# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saclient
  module Errors

    # 要求された操作を行えません. 現在の対象の状態では, この操作を受け付けできません.
    class HttpConflictException < Saclient::Errors::HttpException

      # (static var) @@default_message = '要求された操作を行えません。現在の対象の状態では、この操作を受け付けできません。'

    end

  end
end
