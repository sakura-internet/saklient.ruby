# -*- encoding: UTF-8 -*-

require_relative '../../errors/saclient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'swytch'
require_relative 'ipv4_net'
require_relative 'ipv6_net'

module Saclient
  module Cloud
    module Resource

      # ルータのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Router < Saclient::Cloud::Resource::Resource

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

        # ネットワークのマスク長
        #
        # @return [Fixnum]
        attr_accessor :m_network_mask_len

        # 帯域幅
        #
        # @return [Fixnum]
        attr_accessor :m_band_width_mbps

        # スイッチ
        #
        # @return [String]
        attr_accessor :m_swytch_id

        # @private
        # @return [String]
        def _api_path
          return '/internet'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Internet'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Internet'
        end

        public

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Router] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Router] this
        def reload
          return _reload
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          Saclient::Util::validate_type(client, 'Saclient::Cloud::Client')
          api_deserialize(r)
        end

        # 作成中のルータが利用可能になるまで待機します.
        #
        # @yield [Saclient::Cloud::Resource::Router, bool]
        # @yieldreturn [void]
        # @param [Fixnum] timeoutSec
        # @return [void]
        def after_create(timeoutSec, &callback)
          Saclient::Util::validate_type(timeoutSec, 'Fixnum')
          Saclient::Util::validate_type(callback, 'Proc')
          ret = sleep_while_creating(timeoutSec)
          callback.call(self, ret)
        end

        # 作成中のルータが利用可能になるまで待機します.
        #
        # @param [Fixnum] timeoutSec
        # @return [bool]
        def sleep_while_creating(timeoutSec = 120)
          Saclient::Util::validate_type(timeoutSec, 'Fixnum')
          step = 3
          while 0 < timeoutSec do
            if exists
              reload
              return true
            end
            timeoutSec -= step
            sleep step if 0 < timeoutSec
          end
          return false
        end

        # このルータが接続されているスイッチを取得します.
        #
        # @return [Swytch]
        def get_swytch
          model = Saclient::Util::create_class_instance('saclient.cloud.model.Model_Swytch', [@_client])
          id = get_swytch_id
          return model.get_by_id(id)
        end

        # このルータ＋スイッチでIPv6アドレスを有効にします.
        #
        # @return [Ipv6Net]
        def add_ipv6_net
          result = @_client.request('POST', _api_path + '/' + Saclient::Util::url_encode(_id) + '/ipv6net')
          reload
          return Saclient::Cloud::Resource::Ipv6Net.new(@_client, result[:IPv6Net])
        end

        # このルータ＋スイッチでIPv6アドレスを無効にします.
        #
        # @param [Ipv6Net] ipv6Net
        # @return [Router]
        def remove_ipv6_net(ipv6Net)
          Saclient::Util::validate_type(ipv6Net, 'Saclient::Cloud::Resource::Ipv6Net')
          @_client.request('DELETE', _api_path + '/' + Saclient::Util::url_encode(_id) + '/ipv6net/' + ipv6Net._id)
          reload
          return self
        end

        # このルータ＋スイッチにスタティックルートを追加します.
        #
        # @param [Fixnum] maskLen
        # @param [String] nextHop
        # @return [Ipv4Net]
        def add_static_route(maskLen, nextHop)
          Saclient::Util::validate_type(maskLen, 'Fixnum')
          Saclient::Util::validate_type(nextHop, 'String')
          q = {}
          Saclient::Util::set_by_path(q, 'NetworkMaskLen', maskLen)
          Saclient::Util::set_by_path(q, 'NextHop', nextHop)
          result = @_client.request('POST', _api_path + '/' + Saclient::Util::url_encode(_id) + '/subnet', q)
          reload
          return Saclient::Cloud::Resource::Ipv4Net.new(@_client, result[:Subnet])
        end

        # このルータ＋スイッチからスタティックルートを削除します.
        #
        # @param [Ipv4Net] ipv4Net
        # @return [Router]
        def remove_static_route(ipv4Net)
          Saclient::Util::validate_type(ipv4Net, 'Saclient::Cloud::Resource::Ipv4Net')
          @_client.request('DELETE', _api_path + '/' + Saclient::Util::url_encode(_id) + '/subnet/' + ipv4Net._id)
          reload
          return self
        end

        # このルータ＋スイッチの帯域プランを変更します.
        #
        # @param [Fixnum] bandWidthMbps
        # @return [Router]
        def change_plan(bandWidthMbps)
          Saclient::Util::validate_type(bandWidthMbps, 'Fixnum')
          path = _api_path + '/' + Saclient::Util::url_encode(_id) + '/bandwidth'
          q = {}
          Saclient::Util::set_by_path(q, 'Internet.BandWidthMbps', bandWidthMbps)
          result = @_client.request('PUT', path, q)
          api_deserialize(result[_root_key.to_sym])
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
          Saclient::Util::validate_type(v, 'String')
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
          Saclient::Util::validate_type(v, 'String')
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
        attr_accessor :n_network_mask_len

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Fixnum]
        def get_network_mask_len
          return @m_network_mask_len
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_network_mask_len(v)
          Saclient::Util::validate_type(v, 'Fixnum')
          raise Saclient::Errors::SaclientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saclient::Cloud::Resource::Router#network_mask_len') if !@is_new
          @m_network_mask_len = v
          @n_network_mask_len = true
          return @m_network_mask_len
        end

        public

        # ネットワークのマスク長
        #
        # @return [Fixnum]
        attr_accessor :network_mask_len

        def network_mask_len
          get_network_mask_len
        end

        def network_mask_len=(v)
          set_network_mask_len(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_band_width_mbps

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Fixnum]
        def get_band_width_mbps
          return @m_band_width_mbps
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_band_width_mbps(v)
          Saclient::Util::validate_type(v, 'Fixnum')
          raise Saclient::Errors::SaclientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saclient::Cloud::Resource::Router#band_width_mbps') if !@is_new
          @m_band_width_mbps = v
          @n_band_width_mbps = true
          return @m_band_width_mbps
        end

        public

        # 帯域幅
        #
        # @return [Fixnum]
        attr_accessor :band_width_mbps

        def band_width_mbps
          get_band_width_mbps
        end

        def band_width_mbps=(v)
          set_band_width_mbps(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_swytch_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_swytch_id
          return @m_swytch_id
        end

        public

        # スイッチ
        #
        # @return [String]
        attr_reader :swytch_id

        def swytch_id
          get_swytch_id
        end

        protected

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize_impl(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if Saclient::Util::exists_path(r, 'ID')
            @m_id = (Saclient::Util::get_by_path(r, 'ID')).nil? ? nil : Saclient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saclient::Util::exists_path(r, 'Name')
            @m_name = (Saclient::Util::get_by_path(r, 'Name')).nil? ? nil : Saclient::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saclient::Util::exists_path(r, 'Description')
            @m_description = (Saclient::Util::get_by_path(r, 'Description')).nil? ? nil : Saclient::Util::get_by_path(r, 'Description').to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if Saclient::Util::exists_path(r, 'NetworkMaskLen')
            @m_network_mask_len = (Saclient::Util::get_by_path(r, 'NetworkMaskLen')).nil? ? nil : (Saclient::Util::get_by_path(r, 'NetworkMaskLen').to_s).to_i(10)
          else
            @m_network_mask_len = nil
            @is_incomplete = true
          end
          @n_network_mask_len = false
          if Saclient::Util::exists_path(r, 'BandWidthMbps')
            @m_band_width_mbps = (Saclient::Util::get_by_path(r, 'BandWidthMbps')).nil? ? nil : (Saclient::Util::get_by_path(r, 'BandWidthMbps').to_s).to_i(10)
          else
            @m_band_width_mbps = nil
            @is_incomplete = true
          end
          @n_band_width_mbps = false
          if Saclient::Util::exists_path(r, 'Switch.ID')
            @m_swytch_id = (Saclient::Util::get_by_path(r, 'Switch.ID')).nil? ? nil : Saclient::Util::get_by_path(r, 'Switch.ID').to_s
          else
            @m_swytch_id = nil
            @is_incomplete = true
          end
          @n_swytch_id = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saclient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saclient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saclient::Util::set_by_path(ret, 'Name', @m_name) if withClean || @n_name
          Saclient::Util::set_by_path(ret, 'Description', @m_description) if withClean || @n_description
          Saclient::Util::set_by_path(ret, 'NetworkMaskLen', @m_network_mask_len) if withClean || @n_network_mask_len
          Saclient::Util::set_by_path(ret, 'BandWidthMbps', @m_band_width_mbps) if withClean || @n_band_width_mbps
          Saclient::Util::set_by_path(ret, 'Switch.ID', @m_swytch_id) if withClean || @n_swytch_id
          return ret
        end

      end

    end
  end
end
