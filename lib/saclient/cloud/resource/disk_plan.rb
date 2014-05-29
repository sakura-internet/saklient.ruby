# -*- encoding: UTF-8 -*-

require_relative '../client.rb'

module Saclient
  module Cloud
    module Resource
      
      # ディスクのプラン情報へのアクセス機能を備えたクラス.
      class DiskPlan < Saclient::Cloud::Resource::Resource
        
        # @private
        # @return [String]
        attr_accessor :m_id
        
        # @private
        # @return [String]
        attr_accessor :m_name
        
        # @private
        # @return [String]
        attr_accessor :m_storage_class
        
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
        attr_accessor :n_storage_class
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_storage_class()
          @m_storage_class
        end
        
        # @return [String]
        attr_reader :storage_class
        def storage_class() get_storage_class end
        
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
          if (!r.nil? and r.key?("StorageClass".to_sym))
            @m_storage_class = (r["StorageClass".to_sym]).nil? ? nil : r["StorageClass".to_sym].to_s()
            @n_storage_class = false
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
          if withClean || @n_storage_class
            ret["StorageClass".to_sym] = @m_storage_class
          end
          ret
        end
        
      end
      
    end
  end
end
