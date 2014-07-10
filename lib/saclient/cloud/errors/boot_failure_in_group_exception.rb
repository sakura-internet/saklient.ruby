# -*- encoding: UTF-8 -*-

require_relative 'http_service_unavailable_exception'

module Saclient
  module Cloud
    module Errors

      # サービスが利用できません. サーバ起動グループ指定に問題がある可能性があります.
      class BootFailureInGroupException < Saclient::Cloud::Errors::HttpServiceUnavailableException

        # (static var) @@default_message = 'サービスが利用できません。サーバ起動グループ指定に問題がある可能性があります。'

      end

    end
  end
end
