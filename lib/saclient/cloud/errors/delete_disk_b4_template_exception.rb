# -*- encoding: UTF-8 -*-

require_relative 'http_conflict_exception'

module Saclient
  module Cloud
    module Errors

      # 要求された操作を行えません. このテンプレートから作成したすべてのディスクを削除した後に実行してください.
      class DeleteDiskB4TemplateException < Saclient::Cloud::Errors::HttpConflictException

        # (static var) @@default_message = '要求された操作を行えません。このテンプレートから作成したすべてのディスクを削除した後に実行してください。'

      end

    end
  end
end
