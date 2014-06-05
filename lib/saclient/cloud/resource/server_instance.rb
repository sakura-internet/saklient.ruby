# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative '../util.rb'
require_relative 'resource.rb'

module Saclient
  module Cloud
    module Resource
      
      # サーバインスタンスのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class ServerInstance < Saclient::Cloud::Resource::Resource
        
        # @return [String]
        protected
        attr_accessor :m_status
        
        # @return [String]
        protected
        attr_accessor :m_before_status
        
        # @return [NativeDate]
        protected
        attr_accessor :m_status_changed_at
        
        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        public
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end
        
        # @return [bool]
        protected
        attr_accessor :n_status
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_status()
          @m_status
        end
        
        # @return [String]
        public
        attr_reader :status
        def status() get_status end
        
        # @return [bool]
        protected
        attr_accessor :n_before_status
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_before_status()
          @m_before_status
        end
        
        # @return [String]
        public
        attr_reader :before_status
        def before_status() get_before_status end
        
        # @return [bool]
        protected
        attr_accessor :n_status_changed_at
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [NativeDate]
        protected
        def get_status_changed_at()
          @m_status_changed_at
        end
        
        # @return [NativeDate]
        public
        attr_reader :status_changed_at
        def status_changed_at() get_status_changed_at end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [any] r
        public
        def api_deserialize(r)
          @is_incomplete = true
          if (!r.nil? and r.key?("Status".to_sym))
            @m_status = (r["Status".to_sym]).nil? ? nil : r["Status".to_sym].to_s()
            @n_status = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("BeforeStatus".to_sym))
            @m_before_status = (r["BeforeStatus".to_sym]).nil? ? nil : r["BeforeStatus".to_sym].to_s()
            @n_before_status = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("StatusChangedAt".to_sym))
            @m_status_changed_at = (r["StatusChangedAt".to_sym]).nil? ? nil : r["StatusChangedAt".to_sym].to_s()
            @n_status_changed_at = false
          else
            @is_incomplete = false
          end
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [bool] withClean
        # @return [any]
        public
        def api_serialize(withClean=false)
          ret = {}
          if withClean || @n_status
            ret["Status".to_sym] = @m_status
          end
          if withClean || @n_before_status
            ret["BeforeStatus".to_sym] = @m_before_status
          end
          if withClean || @n_status_changed_at
            ret["StatusChangedAt".to_sym] = (@m_status_changed_at).nil? ? nil : Saclient::Cloud::Util.date2str(@m_status_changed_at)
          end
          ret
        end
        
      end
      
    end
  end
end
