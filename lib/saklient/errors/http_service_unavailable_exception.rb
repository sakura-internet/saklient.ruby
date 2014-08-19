# -*- encoding: UTF-8 -*-

require_relative 'http_exception'

module Saklient
  module Errors

    # サービスが利用できません. 対象は利用できない, またはサーバが混雑しています. このエラーが繰り返し発生する場合は, メンテナンス情報, サポートサイトをご確認ください.
    class HttpServiceUnavailableException < Saklient::Errors::HttpException

      # (static var) @@default_message = 'サービスが利用できません。対象は利用できない、またはサーバが混雑しています。このエラーが繰り返し発生する場合は、メンテナンス情報、サポートサイトをご確認ください。'

    end

  end
end
