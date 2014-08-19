# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. 指定されたネットワークに属するIPアドレスはすべて使用中です.
      class RunOutOfIpAddressException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。指定されたネットワークに属するIPアドレスはすべて使用中です。'

      end

    end
  end
end
