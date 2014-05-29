# -*- encoding: UTF-8 -*-

require_relative '../client.rb'

module Saclient
  module Cloud
    module Resource
      
      # サーバのプラン情報へのアクセス機能を備えたクラス.
      class ServerPlan < Saclient::Cloud::Resource::Resource
        
        # @private
        # @return [String]
        attr_accessor :m_id
        
        # @private
        # @return [String]
        attr_accessor :m_name
        
        # @private
        # @return [Integer]
        attr_accessor :m_cpu
        
        # @private
        # @return [Integer]
        attr_accessor :m_memory_mib
        
        # @private
        # @return [String]
        attr_accessor :m_service_class
        
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
        # @return [Integer]
        def get_memory_gib()
          get_memory_mib() >> 10
        end
        
        # @return [Integer]
        attr_reader :memory_gib
        def memory_gib() get_memory_gib end
        
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
        attr_accessor :n_name
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_name()
          @m_name
        end
        
        # @return [String]
        attr_reader :name
        def name() get_name end
        
        # @private
        # @return [bool]
        attr_accessor :n_cpu
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [Integer]
        def get_cpu()
          @m_cpu
        end
        
        # @return [Integer]
        attr_reader :cpu
        def cpu() get_cpu end
        
        # @private
        # @return [bool]
        attr_accessor :n_memory_mib
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [Integer]
        def get_memory_mib()
          @m_memory_mib
        end
        
        # @return [Integer]
        attr_reader :memory_mib
        def memory_mib() get_memory_mib end
        
        # @private
        # @return [bool]
        attr_accessor :n_service_class
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_service_class()
          @m_service_class
        end
        
        # @return [String]
        attr_reader :service_class
        def service_class() get_service_class end
        
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
          if (!r.nil? and r.key?("Name".to_sym))
            @m_name = (r["Name".to_sym]).nil? ? nil : r["Name".to_sym].to_s()
            @n_name = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("CPU".to_sym))
            @m_cpu = (r["CPU".to_sym]).nil? ? nil : (r["CPU".to_sym].to_s()).to_i(10)
            @n_cpu = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("MemoryMB".to_sym))
            @m_memory_mib = (r["MemoryMB".to_sym]).nil? ? nil : (r["MemoryMB".to_sym].to_s()).to_i(10)
            @n_memory_mib = false
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
        def api_serialize(withClean=false)
          ret = {}
          if withClean || @n_id
            ret["ID".to_sym] = @m_id
          end
          if withClean || @n_name
            ret["Name".to_sym] = @m_name
          end
          if withClean || @n_cpu
            ret["CPU".to_sym] = @m_cpu
          end
          if withClean || @n_memory_mib
            ret["MemoryMB".to_sym] = @m_memory_mib
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
