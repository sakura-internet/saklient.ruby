# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'
require_relative 'swytch'

module Saclient
  module Cloud
    module Resource

      # IPv4ネットワークのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Ipv4Net < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_address

        # @return [Fixnum]
        attr_accessor :m_mask_len

        # @return [String]
        attr_accessor :m_default_route

        # @return [String]
        attr_accessor :m_next_hop

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
        # @param [any] obj
        # @param [bool] wrapped
        # @param [Saclient::Cloud::Client] client
        def initialize(client, obj, wrapped = false)
          super(client)
          Saclient::Util::validate_type(client, 'Saclient::Cloud::Client')
          Saclient::Util::validate_type(wrapped, 'bool')
          api_deserialize(obj, wrapped)
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
        attr_accessor :n_address

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_address
          return @m_address
        end

        public

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
        # @return [Fixnum]
        def get_mask_len
          return @m_mask_len
        end

        public

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
        # @return [String]
        def get_default_route
          return @m_default_route
        end

        public

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
        # @return [String]
        def get_next_hop
          return @m_next_hop
        end

        public

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
          if Saclient::Util::exists_path(r, 'ID')
            @m_id = (Saclient::Util::get_by_path(r, 'ID')).nil? ? nil : Saclient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saclient::Util::exists_path(r, 'NetworkAddress')
            @m_address = (Saclient::Util::get_by_path(r, 'NetworkAddress')).nil? ? nil : Saclient::Util::get_by_path(r, 'NetworkAddress').to_s
          else
            @m_address = nil
            @is_incomplete = true
          end
          @n_address = false
          if Saclient::Util::exists_path(r, 'NetworkMaskLen')
            @m_mask_len = (Saclient::Util::get_by_path(r, 'NetworkMaskLen')).nil? ? nil : (Saclient::Util::get_by_path(r, 'NetworkMaskLen').to_s).to_i(10)
          else
            @m_mask_len = nil
            @is_incomplete = true
          end
          @n_mask_len = false
          if Saclient::Util::exists_path(r, 'DefaultRoute')
            @m_default_route = (Saclient::Util::get_by_path(r, 'DefaultRoute')).nil? ? nil : Saclient::Util::get_by_path(r, 'DefaultRoute').to_s
          else
            @m_default_route = nil
            @is_incomplete = true
          end
          @n_default_route = false
          if Saclient::Util::exists_path(r, 'NextHop')
            @m_next_hop = (Saclient::Util::get_by_path(r, 'NextHop')).nil? ? nil : Saclient::Util::get_by_path(r, 'NextHop').to_s
          else
            @m_next_hop = nil
            @is_incomplete = true
          end
          @n_next_hop = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saclient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saclient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saclient::Util::set_by_path(ret, 'NetworkAddress', @m_address) if withClean || @n_address
          Saclient::Util::set_by_path(ret, 'NetworkMaskLen', @m_mask_len) if withClean || @n_mask_len
          Saclient::Util::set_by_path(ret, 'DefaultRoute', @m_default_route) if withClean || @n_default_route
          Saclient::Util::set_by_path(ret, 'NextHop', @m_next_hop) if withClean || @n_next_hop
          return ret
        end

      end

    end
  end
end
