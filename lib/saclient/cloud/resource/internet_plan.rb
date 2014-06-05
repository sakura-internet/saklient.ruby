# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative 'resource.rb'

module Saclient
  module Cloud
    module Resource
      
      # ルータのプラン情報へのアクセス機能を備えたクラス.
      class InternetPlan < Saclient::Cloud::Resource::Resource
        
        # @return [String]
        protected
        attr_accessor :m_id
        
        # @return [String]
        protected
        attr_accessor :m_name
        
        # @return [Integer]
        protected
        attr_accessor :m_band_width_mbps
        
        # @return [String]
        protected
        attr_accessor :m_service_class
        
        # @private
        # @return [String]
        public
        def _id()
          get_id()
        end
        
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
        attr_accessor :n_id
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_id()
          @m_id
        end
        
        # @return [String]
        public
        attr_reader :id
        def id() get_id end
        
        # @return [bool]
        protected
        attr_accessor :n_name
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_name()
          @m_name
        end
        
        # @return [String]
        public
        attr_reader :name
        def name() get_name end
        
        # @return [bool]
        protected
        attr_accessor :n_band_width_mbps
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [Integer]
        protected
        def get_band_width_mbps()
          @m_band_width_mbps
        end
        
        # @return [Integer]
        public
        attr_reader :band_width_mbps
        def band_width_mbps() get_band_width_mbps end
        
        # @return [bool]
        protected
        attr_accessor :n_service_class
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_service_class()
          @m_service_class
        end
        
        # @return [String]
        public
        attr_reader :service_class
        def service_class() get_service_class end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [any] r
        public
        def api_deserialize(r)
          @is_incomplete = true
          if (!r.nil? and r.key?("ID".to_sym))
            @m_id = (r["ID".to_sym]).nil? ? nil : r["ID".to_sym].to_s()
            @n_id = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("Name".to_sym))
            @m_name = (r["Name".to_sym]).nil? ? nil : r["Name".to_sym].to_s()
            @n_name = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("BandWidthMbps".to_sym))
            @m_band_width_mbps = (r["BandWidthMbps".to_sym]).nil? ? nil : (r["BandWidthMbps".to_sym].to_s()).to_i(10)
            @n_band_width_mbps = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("ServiceClass".to_sym))
            @m_service_class = (r["ServiceClass".to_sym]).nil? ? nil : r["ServiceClass".to_sym].to_s()
            @n_service_class = false
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
          if withClean || @n_id
            ret["ID".to_sym] = @m_id
          end
          if withClean || @n_name
            ret["Name".to_sym] = @m_name
          end
          if withClean || @n_band_width_mbps
            ret["BandWidthMbps".to_sym] = @m_band_width_mbps
          end
          if withClean || @n_service_class
            ret["ServiceClass".to_sym] = @m_service_class
          end
          ret
        end
        
      end
      
    end
  end
end
