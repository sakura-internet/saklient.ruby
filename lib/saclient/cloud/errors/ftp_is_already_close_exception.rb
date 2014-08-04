# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. FTP共有は既に終了されています.
      class FtpIsAlreadyCloseException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。FTP共有は既に終了されています。'

      end

    end
  end
end
