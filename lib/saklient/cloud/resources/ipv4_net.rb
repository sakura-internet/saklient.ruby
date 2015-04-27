# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'
require_relative 'swytch'
require_relative 'ipv4_range'

module Saklient
  module Cloud
    module Resources

      # IPv4ネットワークの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Ipv4Net < Saklient::Cloud::Resources::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # ネットワークアドレス
        #
        # @return [String]
        attr_accessor :m_address

        # マスク長
        #
        # @return [Fixnum]
        attr_accessor :m_mask_len

        # デフォルトルート
        #
        # @return [String]
        attr_accessor :m_default_route

        # ネクストホップ
        #
        # @return [String]
        attr_accessor :m_next_hop

        # @private
        # @return [Ipv4Range]
        attr_accessor :_range

        public

        # @private
        # @return [Ipv4Range]
        def get_range
          return @_range
        end

        # 利用可能なIPアドレス範囲
        #
        # @return [Ipv4Range]
        attr_reader :range

        def range
          get_range
        end

        protected

        # @private
        # @return [String]
        def _api_path
          return '/subnet'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Subnet'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Subnets'
        end

        public

        # @private
        # @return [String]
        def _class_name
          return 'Ipv4Net'
        end

        # @private
        # @return [String]
        def _id
          return get_id
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

        protected

        # @private
        # @param [any] r
        # @param [any] root
        # @return [void]
        def _on_after_api_deserialize(r, root)
          @_range = nil
          addresses = r[:IPAddresses]
          @_range = Saklient::Cloud::Resources::Ipv4Range.new(addresses) if !(addresses).nil?
        end

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
        attr_accessor :n_address

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_address
          return @m_address
        end

        public

        # ネットワークアドレス
        #
        # @return [String]
        attr_reader :address

        def address
          get_address
        end

        protected

        # @return [bool]
        attr_accessor :n_mask_len

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [Fixnum]
        def get_mask_len
          return @m_mask_len
        end

        public

        # マスク長
        #
        # @return [Fixnum]
        attr_reader :mask_len

        def mask_len
          get_mask_len
        end

        protected

        # @return [bool]
        attr_accessor :n_default_route

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_default_route
          return @m_default_route
        end

        public

        # デフォルトルート
        #
        # @return [String]
        attr_reader :default_route

        def default_route
          get_default_route
        end

        protected

        # @return [bool]
        attr_accessor :n_next_hop

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_next_hop
          return @m_next_hop
        end

        public

        # ネクストホップ
        #
        # @return [String]
        attr_reader :next_hop

        def next_hop
          get_next_hop
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
          if Saklient::Util::exists_path(r, 'NetworkAddress')
            @m_address = (Saklient::Util::get_by_path(r, 'NetworkAddress')).nil? ? nil : Saklient::Util::get_by_path(r, 'NetworkAddress').to_s
          else
            @m_address = nil
            @is_incomplete = true
          end
          @n_address = false
          if Saklient::Util::exists_path(r, 'NetworkMaskLen')
            @m_mask_len = (Saklient::Util::get_by_path(r, 'NetworkMaskLen')).nil? ? nil : (Saklient::Util::get_by_path(r, 'NetworkMaskLen').to_s).to_s().to_i(10)
          else
            @m_mask_len = nil
            @is_incomplete = true
          end
          @n_mask_len = false
          if Saklient::Util::exists_path(r, 'DefaultRoute')
            @m_default_route = (Saklient::Util::get_by_path(r, 'DefaultRoute')).nil? ? nil : Saklient::Util::get_by_path(r, 'DefaultRoute').to_s
          else
            @m_default_route = nil
            @is_incomplete = true
          end
          @n_default_route = false
          if Saklient::Util::exists_path(r, 'NextHop')
            @m_next_hop = (Saklient::Util::get_by_path(r, 'NextHop')).nil? ? nil : Saklient::Util::get_by_path(r, 'NextHop').to_s
          else
            @m_next_hop = nil
            @is_incomplete = true
          end
          @n_next_hop = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saklient::Util::set_by_path(ret, 'NetworkAddress', @m_address) if withClean || @n_address
          Saklient::Util::set_by_path(ret, 'NetworkMaskLen', @m_mask_len) if withClean || @n_mask_len
          Saklient::Util::set_by_path(ret, 'DefaultRoute', @m_default_route) if withClean || @n_default_route
          Saklient::Util::set_by_path(ret, 'NextHop', @m_next_hop) if withClean || @n_next_hop
          return ret
        end

      end

    end
  end
end
