# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. テンプレートのFTP共有を終了後に実行してください.
      class TemplateFtpIsOpenException < Saclient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。テンプレートのFTP共有を終了後に実行してください。'

      end

    end
  end
end
