# -*- encoding: UTF-8 -*-

require_relative '../client.rb'

module Saclient
  module Cloud
    module Resource
      
      # インタフェースのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Iface < Saclient::Cloud::Resource::Resource
        
        # @private
        # @return [String]
        attr_accessor :m_id
        
        # @private
        # @return [String]
        attr_accessor :m_mac_address
        
        # @private
        # @return [String]
        attr_accessor :m_ip_address
        
        # @private
        # @return [String]
        attr_accessor :m_user_ip_address
        
        # @private
        # @return [String]
        def _api_path()
          "/interface"
        end
        
        # @private
        # @return [String]
        def _root_key()
          "Interface"
        end
        
        # @private
        # @return [String]
        def _root_key_m()
          "Interfaces"
        end
        
        # @private
        # @return [String]
        def _id()
          get_id()
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新しいインスタンスを作成します.
        # 
        # @return [Iface] this
        def create()
          _create()
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        # 
        # @return [Iface] this
        def save()
          _save()
        end
        
        # 最新のリソース情報を再取得します.
        # 
        # @return [Iface] this
        def reload()
          _reload()
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
        attr_accessor :n_mac_address
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_mac_address()
          @m_mac_address
        end
        
        # @return [String]
        attr_reader :mac_address
        def mac_address() get_mac_address end
        
        # @private
        # @return [bool]
        attr_accessor :n_ip_address
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_ip_address()
          @m_ip_address
        end
        
        # @return [String]
        attr_reader :ip_address
        def ip_address() get_ip_address end
        
        # @private
        # @return [bool]
        attr_accessor :n_user_ip_address
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @return [String]
        def get_user_ip_address()
          @m_user_ip_address
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @private
        # @param [String] v
        # @return [String]
        def set_user_ip_address(v)
          @m_user_ip_address = v
          @n_user_ip_address = true
          @m_user_ip_address
        end
        
        # @return [String]
        attr_accessor :user_ip_address
        def user_ip_address() get_user_ip_address end
        def user_ip_address=(v) set_user_ip_address(v) end
        
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
