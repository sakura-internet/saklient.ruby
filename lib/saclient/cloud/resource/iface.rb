# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'

module Saclient
  module Cloud
    module Resource

      # インタフェースのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Iface < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_mac_address

        # @return [String]
        attr_accessor :m_ip_address

        # @return [String]
        attr_accessor :m_user_ip_address

        # サーバ
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
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
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
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end

        # 共有セグメントに接続します.
        #
        # @return [Iface]
        def connect_to_shared_segment
          @_client.request('PUT', _api_path + '/' + Saclient::Util::url_encode(_id) + '/to/switch/shared')
          return reload
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
        # @return [String]
        def get_mac_address
          return @m_mac_address
        end

        public

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
        # @return [String]
        def get_ip_address
          return @m_ip_address
        end

        public

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
        # @return [String]
        def get_user_ip_address
          return @m_user_ip_address
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_user_ip_address(v)
          @m_user_ip_address = v
          @n_user_ip_address = true
          return @m_user_ip_address
        end

        public

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
        # @return [String]
        def get_server_id
          return @m_server_id
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_server_id(v)
          @m_server_id = v
          @n_server_id = true
          return @m_server_id
        end

        public

        # サーバ
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
          if Saclient::Util::exists_path(r, 'ID')
            @m_id = (Saclient::Util::get_by_path(r, 'ID')).nil? ? nil : Saclient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saclient::Util::exists_path(r, 'MACAddress')
            @m_mac_address = (Saclient::Util::get_by_path(r, 'MACAddress')).nil? ? nil : Saclient::Util::get_by_path(r, 'MACAddress').to_s
          else
            @m_mac_address = nil
            @is_incomplete = true
          end
          @n_mac_address = false
          if Saclient::Util::exists_path(r, 'IPAddress')
            @m_ip_address = (Saclient::Util::get_by_path(r, 'IPAddress')).nil? ? nil : Saclient::Util::get_by_path(r, 'IPAddress').to_s
          else
            @m_ip_address = nil
            @is_incomplete = true
          end
          @n_ip_address = false
          if Saclient::Util::exists_path(r, 'UserIPAddress')
            @m_user_ip_address = (Saclient::Util::get_by_path(r, 'UserIPAddress')).nil? ? nil : Saclient::Util::get_by_path(r, 'UserIPAddress').to_s
          else
            @m_user_ip_address = nil
            @is_incomplete = true
          end
          @n_user_ip_address = false
          if Saclient::Util::exists_path(r, 'Server.ID')
            @m_server_id = (Saclient::Util::get_by_path(r, 'Server.ID')).nil? ? nil : Saclient::Util::get_by_path(r, 'Server.ID').to_s
          else
            @m_server_id = nil
            @is_incomplete = true
          end
          @n_server_id = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          ret = {}
          Saclient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saclient::Util::set_by_path(ret, 'MACAddress', @m_mac_address) if withClean || @n_mac_address
          Saclient::Util::set_by_path(ret, 'IPAddress', @m_ip_address) if withClean || @n_ip_address
          Saclient::Util::set_by_path(ret, 'UserIPAddress', @m_user_ip_address) if withClean || @n_user_ip_address
          Saclient::Util::set_by_path(ret, 'Server.ID', @m_server_id) if withClean || @n_server_id
          return ret
        end

      end

    end
  end
end
