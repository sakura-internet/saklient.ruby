# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # HTTPエラー. Variant Also Negotiates.
    class HttpVariantAlsoNegotiatesException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'HTTPエラー。Variant Also Negotiates.'

    end

  end
end
