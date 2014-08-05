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

module Saclient
  module Cloud

    # さくらのクラウドAPIクライアントを利用する際, 最初にアクセスすべきルートとなるクラス.
    #
    # @see API.authorize
    class API

      protected

      # @private
      # @return [Client]
      attr_accessor :_client

      # @return [Client]
      def get_client
        return @_client
      end

      public

      # @return [Client]
      attr_reader :client

      def client
        get_client
      end

      protected

      # @private
      # @return [Product]
      attr_accessor :_product

      # @return [Product]
      def get_product
        return @_product
      end

      public

      # @return [Product]
      attr_reader :product

      def product
        get_product
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Icon]
      attr_accessor :_icon

      # @return [Saclient::Cloud::Model::Model_Icon]
      def get_icon
        return @_icon
      end

      public

      # @return [Saclient::Cloud::Model::Model_Icon]
      attr_reader :icon

      def icon
        get_icon
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Server]
      attr_accessor :_server

      # @return [Saclient::Cloud::Model::Model_Server]
      def get_server
        return @_server
      end

      public

      # @return [Saclient::Cloud::Model::Model_Server]
      attr_reader :server

      def server
        get_server
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Disk]
      attr_accessor :_disk

      # @return [Saclient::Cloud::Model::Model_Disk]
      def get_disk
        return @_disk
      end

      public

      # @return [Saclient::Cloud::Model::Model_Disk]
      attr_reader :disk

      def disk
        get_disk
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Appliance]
      attr_accessor :_appliance

      # @return [Saclient::Cloud::Model::Model_Appliance]
      def get_appliance
        return @_appliance
      end

      public

      # @return [Saclient::Cloud::Model::Model_Appliance]
      attr_reader :appliance

      def appliance
        get_appliance
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Archive]
      attr_accessor :_archive

      # @return [Saclient::Cloud::Model::Model_Archive]
      def get_archive
        return @_archive
      end

      public

      # @return [Saclient::Cloud::Model::Model_Archive]
      attr_reader :archive

      def archive
        get_archive
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_IsoImage]
      attr_accessor :_iso_image

      # @return [Saclient::Cloud::Model::Model_IsoImage]
      def get_iso_image
        return @_iso_image
      end

      public

      # @return [Saclient::Cloud::Model::Model_IsoImage]
      attr_reader :iso_image

      def iso_image
        get_iso_image
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Iface]
      attr_accessor :_iface

      # @return [Saclient::Cloud::Model::Model_Iface]
      def get_iface
        return @_iface
      end

      public

      # @return [Saclient::Cloud::Model::Model_Iface]
      attr_reader :iface

      def iface
        get_iface
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Swytch]
      attr_accessor :_swytch

      # @return [Saclient::Cloud::Model::Model_Swytch]
      def get_swytch
        return @_swytch
      end

      public

      # @return [Saclient::Cloud::Model::Model_Swytch]
      attr_reader :swytch

      def swytch
        get_swytch
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Router]
      attr_accessor :_router

      # @return [Saclient::Cloud::Model::Model_Router]
      def get_router
        return @_router
      end

      public

      # @return [Saclient::Cloud::Model::Model_Router]
      attr_reader :router

      def router
        get_router
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_Ipv6Net]
      attr_accessor :_ipv6_net

      # @return [Saclient::Cloud::Model::Model_Ipv6Net]
      def get_ipv6_net
        return @_ipv6_net
      end

      public

      # @return [Saclient::Cloud::Model::Model_Ipv6Net]
      attr_reader :ipv6_net

      def ipv6_net
        get_ipv6_net
      end

      protected

      # @param [Client] client
      def initialize(client)
        Saclient::Util::validate_type(client, 'Saclient::Cloud::Client')
        @_client = client
        @_product = Saclient::Cloud::Product.new(client)
        @_icon = Saclient::Cloud::Model::Model_Icon.new(client)
        @_server = Saclient::Cloud::Model::Model_Server.new(client)
        @_disk = Saclient::Cloud::Model::Model_Disk.new(client)
        @_appliance = Saclient::Cloud::Model::Model_Appliance.new(client)
        @_archive = Saclient::Cloud::Model::Model_Archive.new(client)
        @_iso_image = Saclient::Cloud::Model::Model_IsoImage.new(client)
        @_iface = Saclient::Cloud::Model::Model_Iface.new(client)
        @_swytch = Saclient::Cloud::Model::Model_Swytch.new(client)
        @_router = Saclient::Cloud::Model::Model_Router.new(client)
        @_ipv6_net = Saclient::Cloud::Model::Model_Ipv6Net.new(client)
      end

      public

      # 指定した認証情報を用いてアクセスを行うAPIクライアントを作成します.
      # 必要な認証情報は, コントロールパネル右上にあるアカウントのプルダウンから
      # 「設定」を選択し, 「APIキー」のページにて作成できます.
      #
      # @param [String] token ACCESS TOKEN
      # @param [String] secret ACCESS TOKEN SECRET
      # @return [API] APIクライアント
      def self.authorize(token, secret)
        Saclient::Util::validate_type(token, 'String')
        Saclient::Util::validate_type(secret, 'String')
        c = Saclient::Cloud::Client.new(token, secret)
        return Saclient::Cloud::API.new(c)
      end

      # 認証情報を引き継ぎ, 指定したゾーンへのアクセスを行うAPIクライアントを作成します.
      #
      # @param [String] name ゾーン名
      # @return [API] APIクライアント
      def in_zone(name)
        Saclient::Util::validate_type(name, 'String')
        ret = Saclient::Cloud::API.new(@_client.clone_instance)
        ret._client.set_api_root('https://secure.sakura.ad.jp/cloud/')
        ret._client.set_api_root_suffix('zone/' + name)
        return ret
      end

      # @param [Fixnum] sec
      # @return [void]
      def sleep(sec)
        Saclient::Util::validate_type(sec, 'Fixnum')
        sleep sec
      end

    end

  end
end
