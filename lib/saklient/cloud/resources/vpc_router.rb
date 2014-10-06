# -*- encoding: UTF-8 -*-

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'appliance'

module Saklient
  module Cloud
    module Resources

      # ロードバランサの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class VpcRouter < Saklient::Cloud::Resources::Appliance

        # @private
        # @param [Saklient::Cloud::Client] client
        # @param [any] obj
        # @param [bool] wrapped
        def initialize(client, obj, wrapped = false)
          super(client, obj, wrapped)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(wrapped, 'bool')
        end

      end

    end
  end
end
