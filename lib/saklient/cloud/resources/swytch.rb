# -*- encoding: UTF-8 -*-

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'router'
require_relative 'ipv4_net'
require_relative 'ipv6_net'
require_relative 'bridge'

module Saklient
  module Cloud
    module Resources

      # スイッチの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Swytch < Saklient::Cloud::Resources::Resource

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

        # タグ文字列の配列
        #
        # @return [Array<String>]
        attr_accessor :m_tags

        # アイコン
        #
        # @return [Icon]
        attr_accessor :m_icon

        # ユーザ設定IPv4ネットワークのゲートウェイ
        #
        # @return [String]
        attr_accessor :m_user_default_route

        # ユーザ設定IPv4ネットワークのマスク長
        #
        # @return [Fixnum]
        attr_accessor :m_user_mask_len

        # 接続されているルータ
        #
        # @return [Router]
        attr_accessor :m_router

        # 接続されているブリッジ
        #
        # @return [Bridge]
        attr_accessor :m_bridge

        # IPv4ネットワーク（ルータによる自動割当） {Ipv4Net} の配列
        #
        # @return [Array<Ipv4Net>]
        attr_accessor :m_ipv4_nets

        # IPv6ネットワーク（ルータによる自動割当） {Ipv6Net} の配列
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
        def _class_name
          return 'Swytch'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
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
        # @param [Saklient::Cloud::Client] client
        # @param [any] obj
        # @param [bool] wrapped
        def initialize(client, obj, wrapped = false)
          super(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(wrapped, 'bool')
          api_deserialize(obj, wrapped)
        end

        # このルータ＋スイッチでIPv6アドレスを有効にします.
        #
        # @return [Ipv6Net] 有効化されたIPv6ネットワーク
        def add_ipv6_net
          ret = get_router.add_ipv6_net
          reload
          return ret
        end

        # このルータ＋スイッチでIPv6アドレスを無効にします.
        #
        # @return [Swytch] this
        def remove_ipv6_net
          nets = get_ipv6_nets
          get_router.remove_ipv6_net(nets[0])
          reload
          return self
        end

        # このルータ＋スイッチにスタティックルートを追加します.
        #
        # @param [Fixnum] maskLen
        # @param [String] nextHop
        # @return [Ipv4Net] 追加されたIPv4ネットワーク
        def add_static_route(maskLen, nextHop)
          Saklient::Util::validate_type(maskLen, 'Fixnum')
          Saklient::Util::validate_type(nextHop, 'String')
          ret = get_router.add_static_route(maskLen, nextHop)
          reload
          return ret
        end

        # このルータ＋スイッチからスタティックルートを削除します.
        #
        # @param [Ipv4Net] ipv4Net
        # @return [Swytch] this
        def remove_static_route(ipv4Net)
          Saklient::Util::validate_type(ipv4Net, 'Saklient::Cloud::Resources::Ipv4Net')
          get_router.remove_static_route(ipv4Net)
          reload
          return self
        end

        # このルータ＋スイッチの帯域プランを変更します.
        #
        # @param [Fixnum] bandWidthMbps 帯域幅（api.product.router.find() から取得できる {RouterPlan} の bandWidthMbps を指定）.
        # @return [Swytch] this
        def change_plan(bandWidthMbps)
          Saklient::Util::validate_type(bandWidthMbps, 'Fixnum')
          get_router.change_plan(bandWidthMbps)
          reload
          return self
        end

        # このルータ＋スイッチをブリッジに接続します.
        #
        # @param swytch 接続先のブリッジ.
        # @param [Bridge] bridge
        # @return [Swytch] this
        def connect_to_bridge(bridge)
          Saklient::Util::validate_type(bridge, 'Saklient::Cloud::Resources::Bridge')
          result = @_client.request('PUT', _api_path + '/' + _id + '/to/bridge/' + bridge._id)
          reload
          return self
        end

        # このルータ＋スイッチをブリッジから切断します.
        #
        # @return [Swytch] this
        def disconnect_from_bridge
          result = @_client.request('DELETE', _api_path + '/' + _id + '/to/bridge')
          reload
          return self
        end

        protected

        # @private
        # @return [any]
        def _used_ipv4_address_hash
          filter = {}
          filter[('Switch' + '.ID').to_sym] = _id
          query = {}
          Saklient::Util::set_by_path(query, 'Count', 0)
          Saklient::Util::set_by_path(query, 'Filter', filter)
          Saklient::Util::set_by_path(query, 'Include', ['IPAddress', 'UserIPAddress'])
          result = @_client.request('GET', '/interface', query)
          return nil if (result).nil?
          result = result[:Interfaces]
          return nil if (result).nil?
          ifaces = result
          return nil if (ifaces).nil?
          found = {}
          for iface in ifaces
            ip = iface[:IPAddress]
            userIp = iface[:UserIPAddress]
            ip = userIp if (ip).nil?
            found[ip.to_sym] = true if !(ip).nil?
          end
          return found
        end

        public

        # このルータ＋スイッチに接続中のインタフェースに割り当てられているIPアドレスを収集します.
        #
        # @return [Array<String>]
        def collect_used_ipv4_addresses
          found = _used_ipv4_address_hash
          return found.keys.map{|k| k.to_s}.sort()
        end

        # このルータ＋スイッチで利用できる未使用のIPアドレスを収集します.
        #
        # @return [Array<String>]
        def collect_unused_ipv4_addresses
          nets = get_ipv4_nets
          return nil if nets.length < 1
          used = _used_ipv4_address_hash
          ret = []
          for ip in nets[0].range.as_array
            ret << ip if !(!used.nil? && used.key?(ip.to_sym))
          end
          return ret.sort()
        end

        protected

        # @return [bool]
        attr_accessor :n_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
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
        # @private
        # @return [String]
        def get_name
          return @m_name
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_name(v)
          Saklient::Util::validate_type(v, 'String')
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
        # @private
        # @return [String]
        def get_description
          return @m_description
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_description(v)
          Saklient::Util::validate_type(v, 'String')
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
        attr_accessor :n_tags

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [Array<String>]
        def get_tags
          @n_tags = true
          return @m_tags
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [Array<String>] v
        # @return [Array<String>]
        def set_tags(v)
          Saklient::Util::validate_type(v, 'Array')
          @m_tags = v
          @n_tags = true
          return @m_tags
        end

        public

        # タグ文字列の配列
        #
        # @return [Array<String>]
        attr_accessor :tags

        def tags
          get_tags
        end

        def tags=(v)
          set_tags(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_icon

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [Icon]
        def get_icon
          return @m_icon
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [Icon] v
        # @return [Icon]
        def set_icon(v)
          Saklient::Util::validate_type(v, 'Saklient::Cloud::Resources::Icon')
          @m_icon = v
          @n_icon = true
          return @m_icon
        end

        public

        # アイコン
        #
        # @return [Icon]
        attr_accessor :icon

        def icon
          get_icon
        end

        def icon=(v)
          set_icon(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_user_default_route

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_user_default_route
          return @m_user_default_route
        end

        public

        # ユーザ設定IPv4ネットワークのゲートウェイ
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
        # @private
        # @return [Fixnum]
        def get_user_mask_len
          return @m_user_mask_len
        end

        public

        # ユーザ設定IPv4ネットワークのマスク長
        #
        # @return [Fixnum]
        attr_reader :user_mask_len

        def user_mask_len
          get_user_mask_len
        end

        protected

        # @return [bool]
        attr_accessor :n_router

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
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
        attr_accessor :n_bridge

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [Bridge]
        def get_bridge
          return @m_bridge
        end

        public

        # 接続されているブリッジ
        #
        # @return [Bridge]
        attr_reader :bridge

        def bridge
          get_bridge
        end

        protected

        # @return [bool]
        attr_accessor :n_ipv4_nets

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [Array<Ipv4Net>]
        def get_ipv4_nets
          return @m_ipv4_nets
        end

        public

        # IPv4ネットワーク（ルータによる自動割当） {Ipv4Net} の配列
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
        # @private
        # @return [Array<Ipv6Net>]
        def get_ipv6_nets
          return @m_ipv6_nets
        end

        public

        # IPv6ネットワーク（ルータによる自動割当） {Ipv6Net} の配列
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
          if Saklient::Util::exists_path(r, 'ID')
            @m_id = (Saklient::Util::get_by_path(r, 'ID')).nil? ? nil : Saklient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saklient::Util::exists_path(r, 'Name')
            @m_name = (Saklient::Util::get_by_path(r, 'Name')).nil? ? nil : Saklient::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saklient::Util::exists_path(r, 'Description')
            @m_description = (Saklient::Util::get_by_path(r, 'Description')).nil? ? nil : Saklient::Util::get_by_path(r, 'Description').to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if Saklient::Util::exists_path(r, 'Tags')
            if (Saklient::Util::get_by_path(r, 'Tags')).nil?
              @m_tags = []
            else
              @m_tags = []
              for t in Saklient::Util::get_by_path(r, 'Tags')
                v1 = nil
                v1 = (t).nil? ? nil : t.to_s
                @m_tags << v1
              end
            end
          else
            @m_tags = nil
            @is_incomplete = true
          end
          @n_tags = false
          if Saklient::Util::exists_path(r, 'Icon')
            @m_icon = (Saklient::Util::get_by_path(r, 'Icon')).nil? ? nil : Saklient::Cloud::Resources::Icon.new(@_client, Saklient::Util::get_by_path(r, 'Icon'))
          else
            @m_icon = nil
            @is_incomplete = true
          end
          @n_icon = false
          if Saklient::Util::exists_path(r, 'UserSubnet.DefaultRoute')
            @m_user_default_route = (Saklient::Util::get_by_path(r, 'UserSubnet.DefaultRoute')).nil? ? nil : Saklient::Util::get_by_path(r, 'UserSubnet.DefaultRoute').to_s
          else
            @m_user_default_route = nil
            @is_incomplete = true
          end
          @n_user_default_route = false
          if Saklient::Util::exists_path(r, 'UserSubnet.NetworkMaskLen')
            @m_user_mask_len = (Saklient::Util::get_by_path(r, 'UserSubnet.NetworkMaskLen')).nil? ? nil : (Saklient::Util::get_by_path(r, 'UserSubnet.NetworkMaskLen').to_s).to_s().to_i(10)
          else
            @m_user_mask_len = nil
            @is_incomplete = true
          end
          @n_user_mask_len = false
          if Saklient::Util::exists_path(r, 'Internet')
            @m_router = (Saklient::Util::get_by_path(r, 'Internet')).nil? ? nil : Saklient::Cloud::Resources::Router.new(@_client, Saklient::Util::get_by_path(r, 'Internet'))
          else
            @m_router = nil
            @is_incomplete = true
          end
          @n_router = false
          if Saklient::Util::exists_path(r, 'Bridge')
            @m_bridge = (Saklient::Util::get_by_path(r, 'Bridge')).nil? ? nil : Saklient::Cloud::Resources::Bridge.new(@_client, Saklient::Util::get_by_path(r, 'Bridge'))
          else
            @m_bridge = nil
            @is_incomplete = true
          end
          @n_bridge = false
          if Saklient::Util::exists_path(r, 'Subnets')
            if (Saklient::Util::get_by_path(r, 'Subnets')).nil?
              @m_ipv4_nets = []
            else
              @m_ipv4_nets = []
              for t in Saklient::Util::get_by_path(r, 'Subnets')
                v2 = nil
                v2 = (t).nil? ? nil : Saklient::Cloud::Resources::Ipv4Net.new(@_client, t)
                @m_ipv4_nets << v2
              end
            end
          else
            @m_ipv4_nets = nil
            @is_incomplete = true
          end
          @n_ipv4_nets = false
          if Saklient::Util::exists_path(r, 'IPv6Nets')
            if (Saklient::Util::get_by_path(r, 'IPv6Nets')).nil?
              @m_ipv6_nets = []
            else
              @m_ipv6_nets = []
              for t in Saklient::Util::get_by_path(r, 'IPv6Nets')
                v3 = nil
                v3 = (t).nil? ? nil : Saklient::Cloud::Resources::Ipv6Net.new(@_client, t)
                @m_ipv6_nets << v3
              end
            end
          else
            @m_ipv6_nets = nil
            @is_incomplete = true
          end
          @n_ipv6_nets = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          missing = []
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          if withClean || @n_name
            Saklient::Util::set_by_path(ret, 'Name', @m_name)
          else
            missing << 'name' if @is_new
          end
          Saklient::Util::set_by_path(ret, 'Description', @m_description) if withClean || @n_description
          if withClean || @n_tags
            Saklient::Util::set_by_path(ret, 'Tags', [])
            for r1 in @m_tags
              v = nil
              v = r1
              ret[:Tags] << v
            end
          end
          Saklient::Util::set_by_path(ret, 'Icon', withClean ? ((@m_icon).nil? ? nil : @m_icon.api_serialize(withClean)) : ((@m_icon).nil? ? { ID: '0' } : @m_icon.api_serialize_id)) if withClean || @n_icon
          Saklient::Util::set_by_path(ret, 'UserSubnet.DefaultRoute', @m_user_default_route) if withClean || @n_user_default_route
          Saklient::Util::set_by_path(ret, 'UserSubnet.NetworkMaskLen', @m_user_mask_len) if withClean || @n_user_mask_len
          Saklient::Util::set_by_path(ret, 'Internet', withClean ? ((@m_router).nil? ? nil : @m_router.api_serialize(withClean)) : ((@m_router).nil? ? { ID: '0' } : @m_router.api_serialize_id)) if withClean || @n_router
          Saklient::Util::set_by_path(ret, 'Bridge', withClean ? ((@m_bridge).nil? ? nil : @m_bridge.api_serialize(withClean)) : ((@m_bridge).nil? ? { ID: '0' } : @m_bridge.api_serialize_id)) if withClean || @n_bridge
          if withClean || @n_ipv4_nets
            Saklient::Util::set_by_path(ret, 'Subnets', [])
            for r2 in @m_ipv4_nets
              v = nil
              v = withClean ? ((r2).nil? ? nil : r2.api_serialize(withClean)) : ((r2).nil? ? { ID: '0' } : r2.api_serialize_id)
              ret[:Subnets] << v
            end
          end
          if withClean || @n_ipv6_nets
            Saklient::Util::set_by_path(ret, 'IPv6Nets', [])
            for r3 in @m_ipv6_nets
              v = nil
              v = withClean ? ((r3).nil? ? nil : r3.api_serialize(withClean)) : ((r3).nil? ? { ID: '0' } : r3.api_serialize_id)
              ret[:IPv6Nets] << v
            end
          end
          raise Saklient::Errors::SaklientException.new('required_field', 'Required fields must be set before the Swytch creation: ' + missing.join(', ')) if missing.length > 0
          return ret
        end

      end

    end
  end
end
