# -*- encoding: UTF-8 -*-

require_relative '../util'
require_relative 'client'
require_relative 'product'
require_relative 'models/model_icon'
require_relative 'models/model_server'
require_relative 'models/model_disk'
require_relative 'models/model_appliance'
require_relative 'models/model_archive'
require_relative 'models/model_iso_image'
require_relative 'models/model_iface'
require_relative 'models/model_swytch'
require_relative 'models/model_router'
require_relative 'models/model_ipv6_net'
require_relative 'models/model_script'

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
      # @return [Saklient::Cloud::Models::Model_Icon]
      attr_accessor :_icon

      # @private
      # @return [Saklient::Cloud::Models::Model_Icon]
      def get_icon
        return @_icon
      end

      public

      # アイコンにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Icon]
      attr_reader :icon

      def icon
        get_icon
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Server]
      attr_accessor :_server

      # @private
      # @return [Saklient::Cloud::Models::Model_Server]
      def get_server
        return @_server
      end

      public

      # サーバにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Server]
      attr_reader :server

      def server
        get_server
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Disk]
      attr_accessor :_disk

      # @private
      # @return [Saklient::Cloud::Models::Model_Disk]
      def get_disk
        return @_disk
      end

      public

      # ディスクにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Disk]
      attr_reader :disk

      def disk
        get_disk
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Appliance]
      attr_accessor :_appliance

      # @private
      # @return [Saklient::Cloud::Models::Model_Appliance]
      def get_appliance
        return @_appliance
      end

      public

      # アプライアンスにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Appliance]
      attr_reader :appliance

      def appliance
        get_appliance
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Archive]
      attr_accessor :_archive

      # @private
      # @return [Saklient::Cloud::Models::Model_Archive]
      def get_archive
        return @_archive
      end

      public

      # アーカイブにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Archive]
      attr_reader :archive

      def archive
        get_archive
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_IsoImage]
      attr_accessor :_iso_image

      # @private
      # @return [Saklient::Cloud::Models::Model_IsoImage]
      def get_iso_image
        return @_iso_image
      end

      public

      # ISOイメージにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_IsoImage]
      attr_reader :iso_image

      def iso_image
        get_iso_image
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Iface]
      attr_accessor :_iface

      # @private
      # @return [Saklient::Cloud::Models::Model_Iface]
      def get_iface
        return @_iface
      end

      public

      # インタフェースにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Iface]
      attr_reader :iface

      def iface
        get_iface
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Swytch]
      attr_accessor :_swytch

      # @private
      # @return [Saklient::Cloud::Models::Model_Swytch]
      def get_swytch
        return @_swytch
      end

      public

      # スイッチにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Swytch]
      attr_reader :swytch

      def swytch
        get_swytch
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Router]
      attr_accessor :_router

      # @private
      # @return [Saklient::Cloud::Models::Model_Router]
      def get_router
        return @_router
      end

      public

      # ルータにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Router]
      attr_reader :router

      def router
        get_router
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Ipv6Net]
      attr_accessor :_ipv6_net

      # @private
      # @return [Saklient::Cloud::Models::Model_Ipv6Net]
      def get_ipv6_net
        return @_ipv6_net
      end

      public

      # IPv6ネットワークにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Ipv6Net]
      attr_reader :ipv6_net

      def ipv6_net
        get_ipv6_net
      end

      protected

      # @private
      # @return [Saklient::Cloud::Models::Model_Script]
      attr_accessor :_script

      # @private
      # @return [Saklient::Cloud::Models::Model_Script]
      def get_script
        return @_script
      end

      public

      # スクリプトにアクセスするためのモデル.
      #
      # @return [Saklient::Cloud::Models::Model_Script]
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
        @_icon = Saklient::Cloud::Models::Model_Icon.new(client)
        @_server = Saklient::Cloud::Models::Model_Server.new(client)
        @_disk = Saklient::Cloud::Models::Model_Disk.new(client)
        @_appliance = Saklient::Cloud::Models::Model_Appliance.new(client)
        @_archive = Saklient::Cloud::Models::Model_Archive.new(client)
        @_iso_image = Saklient::Cloud::Models::Model_IsoImage.new(client)
        @_iface = Saklient::Cloud::Models::Model_Iface.new(client)
        @_swytch = Saklient::Cloud::Models::Model_Swytch.new(client)
        @_router = Saklient::Cloud::Models::Model_Router.new(client)
        @_ipv6_net = Saklient::Cloud::Models::Model_Ipv6Net.new(client)
        @_script = Saklient::Cloud::Models::Model_Script.new(client)
      end

      public

      # 指定した認証情報を用いてアクセスを行うAPIクライアントを作成します.
      #
      # 必要な認証情報は, コントロールパネル右上にあるアカウントのプルダウンから
      # 「設定」を選択し, 「APIキー」のページにて作成できます.
      #
      # @param [String] token ACCESS TOKEN
      # @param [String] secret ACCESS TOKEN SECRET
      # @param [String] zone ゾーン名
      # @return [API] APIクライアント
      def self.authorize(token, secret, zone = nil)
        Saklient::Util::validate_type(token, 'String')
        Saklient::Util::validate_type(secret, 'String')
        Saklient::Util::validate_type(zone, 'String')
        c = Saklient::Cloud::Client.new(token, secret)
        ret = Saklient::Cloud::API.new(c)
        return !(zone).nil? ? ret.in_zone(zone) : ret
      end

      # 認証情報を引き継ぎ, 指定したゾーンへのアクセスを行うAPIクライアントを作成します.
      #
      # @param [String] name ゾーン名
      # @return [API] APIクライアント
      def in_zone(name)
        Saklient::Util::validate_type(name, 'String')
        ret = Saklient::Cloud::API.new(@_client.clone_instance)
        suffix = ''
        suffix = '-test' if name == 'is1x' || name == 'is1y'
        ret._client.set_api_root('https://secure.sakura.ad.jp/cloud' + suffix + '/')
        ret._client.set_api_root_suffix('zone/' + name)
        return ret
      end

    end

  end
end
