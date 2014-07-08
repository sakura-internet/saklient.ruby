# -*- encoding: UTF-8 -*-

require_relative 'client.rb'
require_relative 'product.rb'
require_relative 'model/model_icon.rb'
require_relative 'model/model_server.rb'
require_relative 'model/model_disk.rb'
require_relative 'model/model_appliance.rb'
require_relative 'model/model_archive.rb'
require_relative 'model/model_ipv6_net.rb'

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
        @_client
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
        @_product
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
        @_icon
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
        @_server
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
        @_disk
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
        @_appliance
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
        @_archive
      end

      public

      # @return [Saclient::Cloud::Model::Model_Archive]
      attr_reader :archive

      def archive
        get_archive
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_IPv6Net]
      attr_accessor :_ipv6net

      # @return [Saclient::Cloud::Model::Model_IPv6Net]
      def get_ipv6net
        @_ipv6net
      end

      public

      # @return [Saclient::Cloud::Model::Model_IPv6Net]
      attr_reader :ipv6net

      def ipv6net
        get_ipv6net
      end

      protected

      # @param [Client] client
      def initialize(client)
        @_client = client
        @_product = Saclient::Cloud::Product.new(client)
        @_icon = Saclient::Cloud::Model::Model_Icon.new(client)
        @_server = Saclient::Cloud::Model::Model_Server.new(client)
        @_disk = Saclient::Cloud::Model::Model_Disk.new(client)
        @_appliance = Saclient::Cloud::Model::Model_Appliance.new(client)
        @_archive = Saclient::Cloud::Model::Model_Archive.new(client)
        @_ipv6net = Saclient::Cloud::Model::Model_IPv6Net.new(client)
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
        c = Saclient::Cloud::Client.new(token, secret)
        Saclient::Cloud::API.new(c)
      end

      # 認証情報を引き継ぎ, 指定したゾーンへのアクセスを行うAPIクライアントを作成します.
      #
      # @param [String] name ゾーン名
      # @return [API] APIクライアント
      def in_zone(name)
        ret = Saclient::Cloud::API.new(@_client.clone_instance)
        ret[:_client].set_api_root('https://secure.sakura.ad.jp/cloud/')
        ret[:_client].set_api_root_suffix('zone/' + name)
        ret
      end

    end

  end
end
