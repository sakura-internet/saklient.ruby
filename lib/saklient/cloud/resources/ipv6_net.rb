# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../client'
require_relative 'resource'
require_relative 'swytch'

module Saklient
  module Cloud
    module Resources

      # IPv6ネットワークの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Ipv6Net < Saklient::Cloud::Resources::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # ネットワークプレフィックス
        #
        # @return [String]
        attr_accessor :m_prefix

        # ネットワークプレフィックス長
        #
        # @return [Fixnum]
        attr_accessor :m_prefix_len

        # このネットワーク範囲における最後のIPv6アドレス
        #
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
        def _class_name
          return 'Ipv6Net'
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
        attr_accessor :n_prefix

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_prefix
          return @m_prefix
        end

        public

        # ネットワークプレフィックス
        #
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
        # @private
        # @return [Fixnum]
        def get_prefix_len
          return @m_prefix_len
        end

        public

        # ネットワークプレフィックス長
        #
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
        # @private
        # @return [String]
        def get_prefix_tail
          return @m_prefix_tail
        end

        public

        # このネットワーク範囲における最後のIPv6アドレス
        #
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
          if Saklient::Util::exists_path(r, 'ID')
            @m_id = (Saklient::Util::get_by_path(r, 'ID')).nil? ? nil : Saklient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saklient::Util::exists_path(r, 'IPv6Prefix')
            @m_prefix = (Saklient::Util::get_by_path(r, 'IPv6Prefix')).nil? ? nil : Saklient::Util::get_by_path(r, 'IPv6Prefix').to_s
          else
            @m_prefix = nil
            @is_incomplete = true
          end
          @n_prefix = false
          if Saklient::Util::exists_path(r, 'IPv6PrefixLen')
            @m_prefix_len = (Saklient::Util::get_by_path(r, 'IPv6PrefixLen')).nil? ? nil : (Saklient::Util::get_by_path(r, 'IPv6PrefixLen').to_s).to_s().to_i(10)
          else
            @m_prefix_len = nil
            @is_incomplete = true
          end
          @n_prefix_len = false
          if Saklient::Util::exists_path(r, 'IPv6PrefixTail')
            @m_prefix_tail = (Saklient::Util::get_by_path(r, 'IPv6PrefixTail')).nil? ? nil : Saklient::Util::get_by_path(r, 'IPv6PrefixTail').to_s
          else
            @m_prefix_tail = nil
            @is_incomplete = true
          end
          @n_prefix_tail = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saklient::Util::set_by_path(ret, 'IPv6Prefix', @m_prefix) if withClean || @n_prefix
          Saklient::Util::set_by_path(ret, 'IPv6PrefixLen', @m_prefix_len) if withClean || @n_prefix_len
          Saklient::Util::set_by_path(ret, 'IPv6PrefixTail', @m_prefix_tail) if withClean || @n_prefix_tail
          return ret
        end

      end

    end
  end
end
