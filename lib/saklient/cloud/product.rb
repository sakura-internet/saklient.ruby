# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative 'models/model_server_plan'
require_relative 'models/model_disk_plan'
require_relative 'models/model_router_plan'
require_relative 'models/model_license_info'
require_relative 'client'

module Saklient
  module Cloud

    # 商品情報にアクセスするためのモデルを集めたクラス.
    class Product

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_ServerPlan]
      attr_accessor :_server

      # @private
      # @return [Saklient::Cloud::Models::Model_ServerPlan]
      def get_server
        return @_server
      end

      public

      # サーバプラン情報.
      #
      # @return [Saklient::Cloud::Models::Model_ServerPlan]
      attr_reader :server

      def server
        get_server
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_DiskPlan]
      attr_accessor :_disk

      # @private
      # @return [Saklient::Cloud::Models::Model_DiskPlan]
      def get_disk
        return @_disk
      end

      public

      # ディスクプラン情報.
      #
      # @return [Saklient::Cloud::Models::Model_DiskPlan]
      attr_reader :disk

      def disk
        get_disk
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_RouterPlan]
      attr_accessor :_router

      # @private
      # @return [Saklient::Cloud::Models::Model_RouterPlan]
      def get_router
        return @_router
      end

      public

      # ルータ帯域プラン情報.
      #
      # @return [Saklient::Cloud::Models::Model_RouterPlan]
      attr_reader :router

      def router
        get_router
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_LicenseInfo]
      attr_accessor :_license

      # @private
      # @return [Saklient::Cloud::Models::Model_LicenseInfo]
      def get_license
        return @_license
      end

      public

      # ライセンス種別情報.
      #
      # @return [Saklient::Cloud::Models::Model_LicenseInfo]
      attr_reader :license

      def license
        get_license
      end

      # @private
      # @param [Client] client
      def initialize(client)
        Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
        @_server = Saklient::Cloud::Models::Model_ServerPlan.new(client)
        @_disk = Saklient::Cloud::Models::Model_DiskPlan.new(client)
        @_router = Saklient::Cloud::Models::Model_RouterPlan.new(client)
        @_license = Saklient::Cloud::Models::Model_LicenseInfo.new(client)
      end

    end

  end
end
