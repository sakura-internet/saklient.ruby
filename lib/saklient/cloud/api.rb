# -*- encoding: UTF-8 -*-

require_relative '../util'
require_relative 'client'
require_relative 'product'
require_relative 'model/model_icon'
require_relative 'model/model_server'
require_relative 'model/model_disk'
require_relative 'model/model_appliance'
require_relative 'model/model_archive'
require_relative 'model/model_iso_image'
require_relative 'model/model_iface'
require_relative 'model/model_swytch'
require_relative 'model/model_router'
require_relative 'model/model_ipv6_net'
require_relative 'model/model_script'

module Saklient
  module Cloud

    # さくらのクラウドAPIクライアントを利用する際, 最初にアクセスすべきルートとなるクラス.
    #
    # @see API.authorize
    class API

      protected

      # @private
      # @return [Client]
      attr_accessor :_client

      # @private
      # @return [Client]
      def get_client
        return @_client
      end

      public

      # @private
      # @return [Client]
      attr_reader :client

      def client
        get_client
      end

      protected

      # @private
      # @return [Product]
      attr_accessor :_product

      # @private
      # @return [Product]
      def get_product
        return @_product
      end

      public

      # 商品情報にアクセスするためのモデルを集めたオブジェクト.
      #
      # @return [Product]
      attr_reader :product

      def product
        get_product
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Icon]
      attr_accessor :_icon

      # @private
      # @return [Saklient::Cloud::Model::Model_Icon]
      def get_icon
        return @_icon
      end

      public

      # アイコンにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Icon]
      attr_reader :icon

      def icon
        get_icon
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Server]
      attr_accessor :_server

      # @private
      # @return [Saklient::Cloud::Model::Model_Server]
      def get_server
        return @_server
      end

      public

      # サーバにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Server]
      attr_reader :server

      def server
        get_server
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Disk]
      attr_accessor :_disk

      # @private
      # @return [Saklient::Cloud::Model::Model_Disk]
      def get_disk
        return @_disk
      end

      public

      # ディスクにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Disk]
      attr_reader :disk

      def disk
        get_disk
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Appliance]
      attr_accessor :_appliance

      # @private
      # @return [Saklient::Cloud::Model::Model_Appliance]
      def get_appliance
        return @_appliance
      end

      public

      # アプライアンスにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Appliance]
      attr_reader :appliance

      def appliance
        get_appliance
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Archive]
      attr_accessor :_archive

      # @private
      # @return [Saklient::Cloud::Model::Model_Archive]
      def get_archive
        return @_archive
      end

      public

      # アーカイブにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Archive]
      attr_reader :archive

      def archive
        get_archive
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_IsoImage]
      attr_accessor :_iso_image

      # @private
      # @return [Saklient::Cloud::Model::Model_IsoImage]
      def get_iso_image
        return @_iso_image
      end

      public

      # ISOイメージにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_IsoImage]
      attr_reader :iso_image

      def iso_image
        get_iso_image
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Iface]
      attr_accessor :_iface

      # @private
      # @return [Saklient::Cloud::Model::Model_Iface]
      def get_iface
        return @_iface
      end

      public

      # インタフェースにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Iface]
      attr_reader :iface

      def iface
        get_iface
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Swytch]
      attr_accessor :_swytch

      # @private
      # @return [Saklient::Cloud::Model::Model_Swytch]
      def get_swytch
        return @_swytch
      end

      public

      # スイッチにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Swytch]
      attr_reader :swytch

      def swytch
        get_swytch
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Router]
      attr_accessor :_router

      # @private
      # @return [Saklient::Cloud::Model::Model_Router]
      def get_router
        return @_router
      end

      public

      # ルータにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Router]
      attr_reader :router

      def router
        get_router
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Ipv6Net]
      attr_accessor :_ipv6_net

      # @private
      # @return [Saklient::Cloud::Model::Model_Ipv6Net]
      def get_ipv6_net
        return @_ipv6_net
      end

      public

      # IPv6ネットワークにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Ipv6Net]
      attr_reader :ipv6_net

      def ipv6_net
        get_ipv6_net
      end

      protected

      # @private
      # @return [Saklient::Cloud::Model::Model_Script]
      attr_accessor :_script

      # @private
      # @return [Saklient::Cloud::Model::Model_Script]
      def get_script
        return @_script
      end

      public

      # スクリプトにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Model::Model_Script]
      attr_reader :script

      def script
        get_script
      end

      protected

      # @private
      # @param [Client] client
      def initialize(client)
        Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
        @_client = client
        @_product = Saklient::Cloud::Product.new(client)
        @_icon = Saklient::Cloud::Model::Model_Icon.new(client)
        @_server = Saklient::Cloud::Model::Model_Server.new(client)
        @_disk = Saklient::Cloud::Model::Model_Disk.new(client)
        @_appliance = Saklient::Cloud::Model::Model_Appliance.new(client)
        @_archive = Saklient::Cloud::Model::Model_Archive.new(client)
        @_iso_image = Saklient::Cloud::Model::Model_IsoImage.new(client)
        @_iface = Saklient::Cloud::Model::Model_Iface.new(client)
        @_swytch = Saklient::Cloud::Model::Model_Swytch.new(client)
        @_router = Saklient::Cloud::Model::Model_Router.new(client)
        @_ipv6_net = Saklient::Cloud::Model::Model_Ipv6Net.new(client)
        @_script = Saklient::Cloud::Model::Model_Script.new(client)
      end

      public

      # 指定した認証情報を用いてアクセスを行うAPIクライアントを作成します.
      #
      # 必要な認証情報は, コントロールパネル右上にあるアカウントのプルダウンから
      # 「設定」を選択し, 「APIキー」のページにて作成できます.
      #
      # @param [String] token ACCESS TOKEN
      # @param [String] secret ACCESS TOKEN SECRET
      # @return [API] APIクライアント
      def self.authorize(token, secret)
        Saklient::Util::validate_type(token, 'String')
        Saklient::Util::validate_type(secret, 'String')
        c = Saklient::Cloud::Client.new(token, secret)
        return Saklient::Cloud::API.new(c)
      end

      # 認証情報を引き継ぎ, 指定したゾーンへのアクセスを行うAPIクライアントを作成します.
      #
      # @param [String] name ゾーン名
      # @return [API] APIクライアント
      def in_zone(name)
        Saklient::Util::validate_type(name, 'String')
        ret = Saklient::Cloud::API.new(@_client.clone_instance)
        ret._client.set_api_root_suffix('zone/' + name)
        return ret
      end

    end

  end
end
