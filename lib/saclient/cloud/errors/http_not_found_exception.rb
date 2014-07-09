# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # 対象が見つかりません. 対象は利用できない状態か, IDまたはパスに誤りがあります.
      class HttpNotFoundException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = '対象が見つかりません。対象は利用できない状態か、IDまたはパスに誤りがあります。'

      end

    end
  end
end
