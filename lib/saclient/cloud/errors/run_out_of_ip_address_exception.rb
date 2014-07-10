# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. 指定されたネットワークに属するIPアドレスはすべて使用中です.
      class RunOutOfIpAddressException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。指定されたネットワークに属するIPアドレスはすべて使用中です。'

      end

    end
  end
end
