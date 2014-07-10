# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. FTP共有は既に開始されています.
      class FtpIsAlreadyOpenException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。FTP共有は既に開始されています。'

      end

    end
  end
end
