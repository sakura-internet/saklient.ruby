# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'router'
require_relative 'ipv4_net'
require_relative 'ipv6_net'

module Saclient
  module Cloud
    module Resource

      # スイッチのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Swytch < Saclient::Cloud::Resource::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # 名前
        #
        # @return [String]
        attr_accessor :m_name

        # 説明
        #
        # @return [String]
        attr_accessor :m_description

        # ユーザ設定ネットワークのゲートウェイ
        #
        # @return [String]
        attr_accessor :m_user_default_route

        # ユーザ設定ネットワークのマスク長
        #
        # @return [Integer]
        attr_accessor :m_user_mask_len

        # 接続されているルータ
        #
        # @return [Router]
        attr_accessor :m_router

        # IPv4ネットワーク
        #
        # @return [Array<Ipv4Net>]
        attr_accessor :m_ipv4_nets

        # IPv6ネットワーク
        #
        # @return [Array<Ipv6Net>]
        attr_accessor :m_ipv6_nets

        # @private
        # @return [String]
        def _api_path
          return '/switch'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Switch'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Switches'
        end

        public

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Swytch] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Swytch] this
        def reload
          return _reload
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end

        # このルータ＋スイッチでIPv6アドレスを有効にします.
        #
        # @return [Ipv6Net]
        def add_ipv6_net
          ret = get_router.add_ipv6_net
          reload
          return ret
        end

        # このルータ＋スイッチでIPv6アドレスを無効にします.
        #
        # @return [Swytch]
        def remove_ipv6_net
          nets = get_ipv6_nets
          get_router.remove_ipv6_net(nets[0])
          reload
          return self
        end

        # このルータ＋スイッチにスタティックルートを追加します.
        #
        # @param [Integer] maskLen
        # @param [String] nextHop
        # @return [Ipv4Net]
        def add_static_route(maskLen, nextHop)
          ret = get_router.add_static_route(maskLen, nextHop)
          reload
          return ret
        end

        # このルータ＋スイッチからスタティックルートを削除します.
        #
        # @param [Ipv4Net] ipv4Net
        # @return [Swytch]
        def remove_static_route(ipv4Net)
          get_router.remove_static_route(ipv4Net)
          reload
          return self
        end

        # このルータ＋スイッチの帯域プランを変更します.
        #
        # @param [Integer] bandWidthMbps
        # @return [Swytch]
        def change_plan(bandWidthMbps)
          get_router.change_plan(bandWidthMbps)
          reload
          return self
        end

        protected

        # @return [bool]
        attr_accessor :n_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_id
          return @m_id
        end

        public

        # ID
        #
        # @return [String]
        attr_reader :id

        def id
          get_id
        end

        protected

        # @return [bool]
        attr_accessor :n_name

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_name
          return @m_name
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_name(v)
          @m_name = v
          @n_name = true
          return @m_name
        end

        public

        # 名前
        #
        # @return [String]
        attr_accessor :name

        def name
          get_name
        end

        def name=(v)
          set_name(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_description

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_description
          return @m_description
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_description(v)
          @m_description = v
          @n_description = true
          return @m_description
        end

        public

        # 説明
        #
        # @return [String]
        attr_accessor :description

        def description
          get_description
        end

        def description=(v)
          set_description(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_user_default_route

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_user_default_route
          return @m_user_default_route
        end

        public

        # ユーザ設定ネットワークのゲートウェイ
        #
        # @return [String]
        attr_reader :user_default_route

        def user_default_route
          get_user_default_route
        end

        protected

        # @return [bool]
        attr_accessor :n_user_mask_len

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Integer]
        def get_user_mask_len
          return @m_user_mask_len
        end

        public

        # ユーザ設定ネットワークのマスク長
        #
        # @return [Integer]
        attr_reader :user_mask_len

        def user_mask_len
          get_user_mask_len
        end

        protected

        # @return [bool]
        attr_accessor :n_router

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Router]
        def get_router
          return @m_router
        end

        public

        # 接続されているルータ
        #
        # @return [Router]
        attr_reader :router

        def router
          get_router
        end

        protected

        # @return [bool]
        attr_accessor :n_ipv4_nets

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Array<Ipv4Net>]
        def get_ipv4_nets
          return @m_ipv4_nets
        end

        public

        # IPv4ネットワーク
        #
        # @return [Array<Ipv4Net>]
        attr_reader :ipv4_nets

        def ipv4_nets
          get_ipv4_nets
        end

        protected

        # @return [bool]
        attr_accessor :n_ipv6_nets

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Array<Ipv6Net>]
        def get_ipv6_nets
          return @m_ipv6_nets
        end

        public

        # IPv6ネットワーク
        #
        # @return [Array<Ipv6Net>]
        attr_reader :ipv6_nets

        def ipv6_nets
          get_ipv6_nets
        end

        protected

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize_impl(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if Saclient::Cloud::Util::exists_path(r, 'ID')
            @m_id = (Saclient::Cloud::Util::get_by_path(r, 'ID')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saclient::Cloud::Util::exists_path(r, 'Name')
            @m_name = (Saclient::Cloud::Util::get_by_path(r, 'Name')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saclient::Cloud::Util::exists_path(r, 'Description')
            @m_description = (Saclient::Cloud::Util::get_by_path(r, 'Description')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'Description').to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if Saclient::Cloud::Util::exists_path(r, 'UserSubnet.DefaultRoute')
            @m_user_default_route = (Saclient::Cloud::Util::get_by_path(r, 'UserSubnet.DefaultRoute')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'UserSubnet.DefaultRoute').to_s
          else
            @m_user_default_route = nil
            @is_incomplete = true
          end
          @n_user_default_route = false
          if Saclient::Cloud::Util::exists_path(r, 'UserSubnet.NetworkMaskLen')
            @m_user_mask_len = (Saclient::Cloud::Util::get_by_path(r, 'UserSubnet.NetworkMaskLen')).nil? ? nil : (Saclient::Cloud::Util::get_by_path(r, 'UserSubnet.NetworkMaskLen').to_s).to_i(10)
          else
            @m_user_mask_len = nil
            @is_incomplete = true
          end
          @n_user_mask_len = false
          if Saclient::Cloud::Util::exists_path(r, 'Internet')
            @m_router = (Saclient::Cloud::Util::get_by_path(r, 'Internet')).nil? ? nil : Saclient::Cloud::Resource::Router.new(@_client, Saclient::Cloud::Util::get_by_path(r, 'Internet'))
          else
            @m_router = nil
            @is_incomplete = true
          end
          @n_router = false
          if Saclient::Cloud::Util::exists_path(r, 'Subnets')
            if (Saclient::Cloud::Util::get_by_path(r, 'Subnets')).nil?
              @m_ipv4_nets = []
            else
              @m_ipv4_nets = []
              for t in Saclient::Cloud::Util::get_by_path(r, 'Subnets')
                v1 = nil
                v1 = (t).nil? ? nil : Saclient::Cloud::Resource::Ipv4Net.new(@_client, t)
                @m_ipv4_nets << v1
              end
            end
          else
            @m_ipv4_nets = nil
            @is_incomplete = true
          end
          @n_ipv4_nets = false
          if Saclient::Cloud::Util::exists_path(r, 'IPv6Nets')
            if (Saclient::Cloud::Util::get_by_path(r, 'IPv6Nets')).nil?
              @m_ipv6_nets = []
            else
              @m_ipv6_nets = []
              for t in Saclient::Cloud::Util::get_by_path(r, 'IPv6Nets')
                v2 = nil
                v2 = (t).nil? ? nil : Saclient::Cloud::Resource::Ipv6Net.new(@_client, t)
                @m_ipv6_nets << v2
              end
            end
          else
            @m_ipv6_nets = nil
            @is_incomplete = true
          end
          @n_ipv6_nets = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          ret = {}
          Saclient::Cloud::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saclient::Cloud::Util::set_by_path(ret, 'Name', @m_name) if withClean || @n_name
          Saclient::Cloud::Util::set_by_path(ret, 'Description', @m_description) if withClean || @n_description
          Saclient::Cloud::Util::set_by_path(ret, 'UserSubnet.DefaultRoute', @m_user_default_route) if withClean || @n_user_default_route
          Saclient::Cloud::Util::set_by_path(ret, 'UserSubnet.NetworkMaskLen', @m_user_mask_len) if withClean || @n_user_mask_len
          Saclient::Cloud::Util::set_by_path(ret, 'Internet', withClean ? ((@m_router).nil? ? nil : @m_router.api_serialize(withClean)) : ((@m_router).nil? ? { ID: '0' } : @m_router.api_serialize_id)) if withClean || @n_router
          if withClean || @n_ipv4_nets
            Saclient::Cloud::Util::set_by_path(ret, 'Subnets', [])
            for r1 in @m_ipv4_nets
              v = nil
              v = withClean ? ((r1).nil? ? nil : r1.api_serialize(withClean)) : ((r1).nil? ? { ID: '0' } : r1.api_serialize_id)
              ret[:Subnets] << v
            end
          end
          if withClean || @n_ipv6_nets
            Saclient::Cloud::Util::set_by_path(ret, 'IPv6Nets', [])
            for r2 in @m_ipv6_nets
              v = nil
              v = withClean ? ((r2).nil? ? nil : r2.api_serialize(withClean)) : ((r2).nil? ? { ID: '0' } : r2.api_serialize_id)
              ret[:IPv6Nets] << v
            end
          end
          return ret
        end

      end

    end
  end
end
