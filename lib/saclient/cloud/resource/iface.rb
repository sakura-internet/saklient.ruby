# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative 'resource.rb'

module Saclient
  module Cloud
    module Resource
      
      # インタフェースのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Iface < Saclient::Cloud::Resource::Resource
        
        # @return [String]
        protected
        attr_accessor :m_id
        
        # @return [String]
        protected
        attr_accessor :m_mac_address
        
        # @return [String]
        protected
        attr_accessor :m_ip_address
        
        # @return [String]
        protected
        attr_accessor :m_user_ip_address
        
        # @private
        # @return [String]
        protected
        def _api_path()
          "/interface"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key()
          "Interface"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key_m()
          "Interfaces"
        end
        
        # @private
        # @return [String]
        public
        def _id()
          get_id()
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新しいインスタンスを作成します.
        # 
        # @return [Iface] this
        public
        def create()
          _create()
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        # 
        # @return [Iface] this
        public
        def save()
          _save()
        end
        
        # 最新のリソース情報を再取得します.
        # 
        # @return [Iface] this
        public
        def reload()
          _reload()
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
        attr_accessor :n_mac_address
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_mac_address()
          @m_mac_address
        end
        
        # @return [String]
        public
        attr_reader :mac_address
        def mac_address() get_mac_address end
        
        # @return [bool]
        protected
        attr_accessor :n_ip_address
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_ip_address()
          @m_ip_address
        end
        
        # @return [String]
        public
        attr_reader :ip_address
        def ip_address() get_ip_address end
        
        # @return [bool]
        protected
        attr_accessor :n_user_ip_address
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_user_ip_address()
          @m_user_ip_address
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [String] v
        # @return [String]
        protected
        def set_user_ip_address(v)
          @m_user_ip_address = v
          @n_user_ip_address = true
          @m_user_ip_address
        end
        
        # @return [String]
        public
        attr_accessor :user_ip_address
        def user_ip_address() get_user_ip_address end
        def user_ip_address=(v) set_user_ip_address(v) end
        
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
          if (!r.nil? and r.key?("MACAddress".to_sym))
            @m_mac_address = (r["MACAddress".to_sym]).nil? ? nil : r["MACAddress".to_sym].to_s()
            @n_mac_address = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("IPAddress".to_sym))
            @m_ip_address = (r["IPAddress".to_sym]).nil? ? nil : r["IPAddress".to_sym].to_s()
            @n_ip_address = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("UserIPAddress".to_sym))
            @m_user_ip_address = (r["UserIPAddress".to_sym]).nil? ? nil : r["UserIPAddress".to_sym].to_s()
            @n_user_ip_address = false
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
          if withClean || @n_mac_address
            ret["MACAddress".to_sym] = @m_mac_address
          end
          if withClean || @n_ip_address
            ret["IPAddress".to_sym] = @m_ip_address
          end
          if withClean || @n_user_ip_address
            ret["UserIPAddress".to_sym] = @m_user_ip_address
          end
          ret
        end
        
      end
      
    end
  end
end
