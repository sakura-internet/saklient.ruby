# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. FTP共有によりアップロードされたファイルを操作できません. ファイル名等をご確認ください.
      class FtpCannotCloseException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。FTP共有によりアップロードされたファイルを操作できません。ファイル名等をご確認ください。'

      end

    end
  end
end
