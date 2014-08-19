# -*- encoding: UTF-8 -*-

require_relative 'model/model_server_plan'
require_relative 'model/model_disk_plan'
require_relative 'model/model_router_plan'
require_relative 'client'

module Saklient
  module Cloud

    # 商品情報にアクセスするためのモデルを集めたクラス.
    class Product

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_ServerPlan]
      attr_accessor :_server

      # @return [Saklient::Cloud::Model::Model_ServerPlan]
      def get_server
        return @_server
      end

      public

      # サーバプラン情報.
      #
      # @return [Saklient::Cloud::Model::Model_ServerPlan]
      attr_reader :server

      def server
        get_server
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_DiskPlan]
      attr_accessor :_disk

      # @return [Saklient::Cloud::Model::Model_DiskPlan]
      def get_disk
        return @_disk
      end

      public

      # ディスクプラン情報.
      #
      # @return [Saklient::Cloud::Model::Model_DiskPlan]
      attr_reader :disk

      def disk
        get_disk
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_RouterPlan]
      attr_accessor :_router

      # @return [Saklient::Cloud::Model::Model_RouterPlan]
      def get_router
        return @_router
      end

      public

      # ルータ帯域プラン情報.
      #
      # @return [Saklient::Cloud::Model::Model_RouterPlan]
      attr_reader :router

      def router
        get_router
      end

      # @ignore
      # @param [Client] client
      def initialize(client)
        Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
        @_server = Saklient::Cloud::Model::Model_ServerPlan.new(client)
        @_disk = Saklient::Cloud::Model::Model_DiskPlan.new(client)
        @_router = Saklient::Cloud::Model::Model_RouterPlan.new(client)
      end

    end

  end
end
