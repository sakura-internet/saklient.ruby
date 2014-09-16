# -*- encoding: UTF-8 -*-

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'resource'

module Saklient
  module Cloud
    module Resource

      # インタフェースの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Iface < Saklient::Cloud::Resource::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # MACアドレス
        #
        # @return [String]
        attr_accessor :m_mac_address

        # IPv4アドレス（共有セグメントによる自動割当）
        #
        # @return [String]
        attr_accessor :m_ip_address

        # ユーザ設定IPv4アドレス
        #
        # @return [String]
        attr_accessor :m_user_ip_address

        # このインタフェースが取り付けられているサーバのID
        #
        # @return [String]
        attr_accessor :m_server_id

        # @private
        # @return [String]
        def _api_path
          return '/interface'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Interface'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Interfaces'
        end

        public

        # @private
        # @return [String]
        def _class_name
          return 'Iface'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
        #
        # @return [Iface] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Iface] this
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

        # 共有セグメントに接続します.
        #
        # @return [Iface] this
        def connect_to_shared_segment
          @_client.request('PUT', _api_path + '/' + Saklient::Util::url_encode(_id) + '/to/switch/shared')
          return reload
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
        attr_accessor :n_mac_address

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_mac_address
          return @m_mac_address
        end

        public

        # MACアドレス
        #
        # @return [String]
        attr_reader :mac_address

        def mac_address
          get_mac_address
        end

        protected

        # @return [bool]
        attr_accessor :n_ip_address

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_ip_address
          return @m_ip_address
        end

        public

        # IPv4アドレス（共有セグメントによる自動割当）
        #
        # @return [String]
        attr_reader :ip_address

        def ip_address
          get_ip_address
        end

        protected

        # @return [bool]
        attr_accessor :n_user_ip_address

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_user_ip_address
          return @m_user_ip_address
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_user_ip_address(v)
          Saklient::Util::validate_type(v, 'String')
          @m_user_ip_address = v
          @n_user_ip_address = true
          return @m_user_ip_address
        end

        public

        # ユーザ設定IPv4アドレス
        #
        # @return [String]
        attr_accessor :user_ip_address

        def user_ip_address
          get_user_ip_address
        end

        def user_ip_address=(v)
          set_user_ip_address(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_server_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_server_id
          return @m_server_id
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_server_id(v)
          Saklient::Util::validate_type(v, 'String')
          raise Saklient::Errors::SaklientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saklient::Cloud::Resource::Iface#server_id') if !@is_new
          @m_server_id = v
          @n_server_id = true
          return @m_server_id
        end

        public

        # このインタフェースが取り付けられているサーバのID
        #
        # @return [String]
        attr_accessor :server_id

        def server_id
          get_server_id
        end

        def server_id=(v)
          set_server_id(v)
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
          if Saklient::Util::exists_path(r, 'MACAddress')
            @m_mac_address = (Saklient::Util::get_by_path(r, 'MACAddress')).nil? ? nil : Saklient::Util::get_by_path(r, 'MACAddress').to_s
          else
            @m_mac_address = nil
            @is_incomplete = true
          end
          @n_mac_address = false
          if Saklient::Util::exists_path(r, 'IPAddress')
            @m_ip_address = (Saklient::Util::get_by_path(r, 'IPAddress')).nil? ? nil : Saklient::Util::get_by_path(r, 'IPAddress').to_s
          else
            @m_ip_address = nil
            @is_incomplete = true
          end
          @n_ip_address = false
          if Saklient::Util::exists_path(r, 'UserIPAddress')
            @m_user_ip_address = (Saklient::Util::get_by_path(r, 'UserIPAddress')).nil? ? nil : Saklient::Util::get_by_path(r, 'UserIPAddress').to_s
          else
            @m_user_ip_address = nil
            @is_incomplete = true
          end
          @n_user_ip_address = false
          if Saklient::Util::exists_path(r, 'Server.ID')
            @m_server_id = (Saklient::Util::get_by_path(r, 'Server.ID')).nil? ? nil : Saklient::Util::get_by_path(r, 'Server.ID').to_s
          else
            @m_server_id = nil
            @is_incomplete = true
          end
          @n_server_id = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          missing = []
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saklient::Util::set_by_path(ret, 'MACAddress', @m_mac_address) if withClean || @n_mac_address
          Saklient::Util::set_by_path(ret, 'IPAddress', @m_ip_address) if withClean || @n_ip_address
          Saklient::Util::set_by_path(ret, 'UserIPAddress', @m_user_ip_address) if withClean || @n_user_ip_address
          if withClean || @n_server_id
            Saklient::Util::set_by_path(ret, 'Server.ID', @m_server_id)
          else
            missing << 'server_id' if @is_new
          end
          raise Saklient::Errors::SaklientException.new('required_field', 'Required fields must be set before the Iface creation: ' + missing.join(', ')) if missing.length > 0
          return ret
        end

      end

    end
  end
end
