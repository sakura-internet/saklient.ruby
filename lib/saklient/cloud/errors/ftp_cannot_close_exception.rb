# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. FTP共有によりアップロードされたファイルを操作できません. ファイル名等をご確認ください.
      class FtpCannotCloseException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。FTP共有によりアップロードされたファイルを操作できません。ファイル名等をご確認ください。'

        # @param [Fixnum] status
        # @param [String] code
        # @param [String] message
        def initialize(status, code = nil, message = '')
          super(status, code, message)
        end

      end

    end
  end
end
