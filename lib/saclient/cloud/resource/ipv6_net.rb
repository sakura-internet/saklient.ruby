# -*- encoding: UTF-8 -*-

require_relative '../client.rb'

module Saclient
  module Cloud
    module Resource
      
      # IPv6ネットワークのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class IPv6Net < Saclient::Cloud::Resource::Resource
        
        # @private
        # @return [String]
        attr_accessor :m_id
        
        # @private
        # @return [String]
        attr_accessor :m_ipv6_prefix
        
        # @private
        # @return [Integer]
        attr_accessor :m_ipv6_prefix_len
        
        # @private
        # @return [String]
        attr_accessor :m_ipv6_prefix_tail
        
        # @private
        # @return [String]
        def _id()
          get_id()
        end
        
        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end
        
        # @private
        # @return [bool]
        attr_accessor :n_id
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_id()
          @m_id
        end
        
        # @return [String]
        attr_reader :id
        def id() get_id end
        
        # @private
        # @return [bool]
        attr_accessor :n_ipv6_prefix
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_ipv6_prefix()
          @m_ipv6_prefix
        end
        
        # @return [String]
        attr_reader :ipv6_prefix
        def ipv6_prefix() get_ipv6_prefix end
        
        # @private
        # @return [bool]
        attr_accessor :n_ipv6_prefix_len
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [Integer]
        def get_ipv6_prefix_len()
          @m_ipv6_prefix_len
        end
        
        # @return [Integer]
        attr_reader :ipv6_prefix_len
        def ipv6_prefix_len() get_ipv6_prefix_len end
        
        # @private
        # @return [bool]
        attr_accessor :n_ipv6_prefix_tail
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_ipv6_prefix_tail()
          @m_ipv6_prefix_tail
        end
        
        # @return [String]
        attr_reader :ipv6_prefix_tail
        def ipv6_prefix_tail() get_ipv6_prefix_tail end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [any] r
        def api_deserialize(r)
          @is_incomplete = true
          if (!r.nil? and r.key?("ID".to_sym))
            @m_id = (r["ID".to_sym]).nil? ? nil : r["ID".to_sym].to_s()
            @n_id = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("IPv6Prefix".to_sym))
            @m_ipv6_prefix = (r["IPv6Prefix".to_sym]).nil? ? nil : r["IPv6Prefix".to_sym].to_s()
            @n_ipv6_prefix = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("IPv6PrefixLen".to_sym))
            @m_ipv6_prefix_len = (r["IPv6PrefixLen".to_sym]).nil? ? nil : (r["IPv6PrefixLen".to_sym].to_s()).to_i(10)
            @n_ipv6_prefix_len = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("IPv6PrefixTail".to_sym))
            @m_ipv6_prefix_tail = (r["IPv6PrefixTail".to_sym]).nil? ? nil : r["IPv6PrefixTail".to_sym].to_s()
            @n_ipv6_prefix_tail = false
          else
            @is_incomplete = false
          end
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean=false)
          ret = {}
          if withClean || @n_id
            ret["ID".to_sym] = @m_id
          end
          if withClean || @n_ipv6_prefix
            ret["IPv6Prefix".to_sym] = @m_ipv6_prefix
          end
          if withClean || @n_ipv6_prefix_len
            ret["IPv6PrefixLen".to_sym] = @m_ipv6_prefix_len
          end
          if withClean || @n_ipv6_prefix_tail
            ret["IPv6PrefixTail".to_sym] = @m_ipv6_prefix_tail
          end
          ret
        end
        
      end
      
    end
  end
end
