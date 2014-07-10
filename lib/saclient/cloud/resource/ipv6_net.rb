# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'

module Saclient
  module Cloud
    module Resource

      # IPv6ネットワークのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class IPv6Net < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_ipv6_prefix

        # @return [Integer]
        attr_accessor :m_ipv6_prefix_len

        # @return [String]
        attr_accessor :m_ipv6_prefix_tail

        public

        # @private
        # @return [String]
        def _id
          return get_id
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
        attr_accessor :n_ipv6_prefix

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_ipv6_prefix
          return @m_ipv6_prefix
        end

        public

        # @return [String]
        attr_reader :ipv6_prefix

        def ipv6_prefix
          get_ipv6_prefix
        end

        protected

        # @return [bool]
        attr_accessor :n_ipv6_prefix_len

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Integer]
        def get_ipv6_prefix_len
          return @m_ipv6_prefix_len
        end

        public

        # @return [Integer]
        attr_reader :ipv6_prefix_len

        def ipv6_prefix_len
          get_ipv6_prefix_len
        end

        protected

        # @return [bool]
        attr_accessor :n_ipv6_prefix_tail

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_ipv6_prefix_tail
          return @m_ipv6_prefix_tail
        end

        public

        # @return [String]
        attr_reader :ipv6_prefix_tail

        def ipv6_prefix_tail
          get_ipv6_prefix_tail
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if !r.nil? && r.key?(:ID)
            @m_id = (r[:ID]).nil? ? nil : r[:ID].to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if !r.nil? && r.key?(:IPv6Prefix)
            @m_ipv6_prefix = (r[:IPv6Prefix]).nil? ? nil : r[:IPv6Prefix].to_s
          else
            @m_ipv6_prefix = nil
            @is_incomplete = true
          end
          @n_ipv6_prefix = false
          if !r.nil? && r.key?(:IPv6PrefixLen)
            @m_ipv6_prefix_len = (r[:IPv6PrefixLen]).nil? ? nil : (r[:IPv6PrefixLen].to_s).to_i(10)
          else
            @m_ipv6_prefix_len = nil
            @is_incomplete = true
          end
          @n_ipv6_prefix_len = false
          if !r.nil? && r.key?(:IPv6PrefixTail)
            @m_ipv6_prefix_tail = (r[:IPv6PrefixTail]).nil? ? nil : r[:IPv6PrefixTail].to_s
          else
            @m_ipv6_prefix_tail = nil
            @is_incomplete = true
          end
          @n_ipv6_prefix_tail = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:IPv6Prefix] = @m_ipv6_prefix if withClean || @n_ipv6_prefix
          ret[:IPv6PrefixLen] = @m_ipv6_prefix_len if withClean || @n_ipv6_prefix_len
          ret[:IPv6PrefixTail] = @m_ipv6_prefix_tail if withClean || @n_ipv6_prefix_tail
          return ret
        end

      end

    end
  end
end
