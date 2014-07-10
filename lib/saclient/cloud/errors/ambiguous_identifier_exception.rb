# -*- encoding: UTF-8 -*-

require_relative 'http_not_found_exception'

module Saclient
  module Cloud
    module Errors

      # 対象が見つかりません. 識別名から一意にリソースを特定できません.
      class AmbiguousIdentifierException < Saclient::Cloud::Errors::HttpNotFoundException

        # (static var) @@default_message = '対象が見つかりません。識別名から一意にリソースを特定できません。'

      end

    end
  end
end
