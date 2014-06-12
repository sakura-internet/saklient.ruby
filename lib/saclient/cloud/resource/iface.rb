# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative 'resource.rb'

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

        # @private
        # @return [String]
        def _api_path
          '/interface'
        end

        # @private
        # @return [String]
        def _root_key
          'Interface'
        end

        # @private
        # @return [String]
        def _root_key_m
          'Interfaces'
        end

        public

        # @private
        # @return [String]
        def _id
          get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新しいインスタンスを作成します.
        #
        # @return [Iface] this
        def create
          _create
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Iface] this
        def save
          _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Iface] this
        def reload
          _reload
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end

        protected

        # @return [bool]
        attr_accessor :n_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_id
          @m_id
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
          @m_mac_address
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
          @m_ip_address
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
          @m_user_ip_address
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_user_ip_address(v)
          @m_user_ip_address = v
          @n_user_ip_address = true
          @m_user_ip_address
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

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize(r)
          @is_incomplete = true
          if !r.nil? && r.key?(:ID)
            @m_id = (r[:ID]).nil? ? nil : r[:ID].to_s
            @n_id = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:MACAddress)
            @m_mac_address = (r[:MACAddress]).nil? ? nil : r[:MACAddress].to_s
            @n_mac_address = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:IPAddress)
            @m_ip_address = (r[:IPAddress]).nil? ? nil : r[:IPAddress].to_s
            @n_ip_address = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:UserIPAddress)
            @m_user_ip_address = (r[:UserIPAddress]).nil? ? nil : r[:UserIPAddress].to_s
            @n_user_ip_address = false
          else
            @is_incomplete = false
          end
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:MACAddress] = @m_mac_address if withClean || @n_mac_address
          ret[:IPAddress] = @m_ip_address if withClean || @n_ip_address
          ret[:UserIPAddress] = @m_user_ip_address if withClean || @n_user_ip_address
          ret
        end

      end

    end
  end
end
