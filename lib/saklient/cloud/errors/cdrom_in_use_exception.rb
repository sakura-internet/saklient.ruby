# -*- encoding: UTF-8 -*-

require_relative '../../errors/http_conflict_exception'

module Saklient
  module Cloud
    module Errors

      # 要求された操作を行えません. ISOイメージをサーバから排出後に実行してください.
      class CdromInUseException < Saklient::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。ISOイメージをサーバから排出後に実行してください。'

      end

    end
  end
end