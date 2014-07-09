# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Errors

      # HTTPエラー. Requested Range Not Satisfiable.
      class HttpRequestedRangeNotSatisfiableException < Saclient::Cloud::Errors::HttpException

        # (static var) @@default_message = 'HTTPエラー。Requested Range Not Satisfiable.'

      end

    end
  end
end
