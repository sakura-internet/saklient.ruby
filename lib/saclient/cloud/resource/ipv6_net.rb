# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'
require_relative 'swytch'

module Saclient
  module Cloud
    module Resource

      # IPv6ネットワークのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Ipv6Net < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_prefix

        # @return [Fixnum]
        attr_accessor :m_prefix_len

        # @return [String]
        attr_accessor :m_prefix_tail

        # @private
        # @return [String]
        def _api_path
          return '/ipv6net'
        end

        # @private
        # @return [String]
        def _root_key
          return 'IPv6Net'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'IPv6Nets'
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
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          Saclient::Util::validate_type(client, 'Saclient::Cloud::Client')
          api_deserialize(r)
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
        attr_accessor :n_prefix

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_prefix
          return @m_prefix
        end

        public

        # @return [String]
        attr_reader :prefix

        def prefix
          get_prefix
        end

        protected

        # @return [bool]
        attr_accessor :n_prefix_len

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Fixnum]
        def get_prefix_len
          return @m_prefix_len
        end

        public

        # @return [Fixnum]
        attr_reader :prefix_len

        def prefix_len
          get_prefix_len
        end

        protected

        # @return [bool]
        attr_accessor :n_prefix_tail

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_prefix_tail
          return @m_prefix_tail
        end

        public

        # @return [String]
        attr_reader :prefix_tail

        def prefix_tail
          get_prefix_tail
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
          if Saclient::Util::exists_path(r, 'IPv6Prefix')
            @m_prefix = (Saclient::Util::get_by_path(r, 'IPv6Prefix')).nil? ? nil : Saclient::Util::get_by_path(r, 'IPv6Prefix').to_s
          else
            @m_prefix = nil
            @is_incomplete = true
          end
          @n_prefix = false
          if Saclient::Util::exists_path(r, 'IPv6PrefixLen')
            @m_prefix_len = (Saclient::Util::get_by_path(r, 'IPv6PrefixLen')).nil? ? nil : (Saclient::Util::get_by_path(r, 'IPv6PrefixLen').to_s).to_i(10)
          else
            @m_prefix_len = nil
            @is_incomplete = true
          end
          @n_prefix_len = false
          if Saclient::Util::exists_path(r, 'IPv6PrefixTail')
            @m_prefix_tail = (Saclient::Util::get_by_path(r, 'IPv6PrefixTail')).nil? ? nil : Saclient::Util::get_by_path(r, 'IPv6PrefixTail').to_s
          else
            @m_prefix_tail = nil
            @is_incomplete = true
          end
          @n_prefix_tail = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saclient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saclient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saclient::Util::set_by_path(ret, 'IPv6Prefix', @m_prefix) if withClean || @n_prefix
          Saclient::Util::set_by_path(ret, 'IPv6PrefixLen', @m_prefix_len) if withClean || @n_prefix_len
          Saclient::Util::set_by_path(ret, 'IPv6PrefixTail', @m_prefix_tail) if withClean || @n_prefix_tail
          return ret
        end

      end

    end
  end
end
