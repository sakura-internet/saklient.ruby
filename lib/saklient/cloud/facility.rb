# -*- encoding: UTF-8 -*-

require_relative 'models/model_region'
require_relative 'client'

module Saklient
  module Cloud

    # 設備情報にアクセスするためのモデルを集めたクラス.
    class Facility

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Region]
      attr_accessor :_region

      # @private
      # @return [Saklient::Cloud::Models::Model_Region]
      def get_region
        return @_region
      end

      public

      # リージョン情報.
      #
      # @return [Saklient::Cloud::Models::Model_Region]
      attr_reader :region

      def region
        get_region
      end

      # @private
      # @param [Client] client
      def initialize(client)
        Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
        @_region = Saklient::Cloud::Models::Model_Region.new(client)
      end

    end

  end
end
