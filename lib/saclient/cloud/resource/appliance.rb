# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative 'resource.rb'
require_relative 'icon.rb'
require_relative 'iface.rb'

module Saclient
  module Cloud
    module Resource
      
      # アプライアンスのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Appliance < Saclient::Cloud::Resource::Resource
        
        # ID
        # 
        # @return [String]
        protected
        attr_accessor :m_id
        
        # クラス
        # 
        # @return [String]
        protected
        attr_accessor :m_clazz
        
        # 名前
        # 
        # @return [String]
        protected
        attr_accessor :m_name
        
        # 説明
        # 
        # @return [String]
        protected
        attr_accessor :m_description
        
        # タグ
        # 
        # @return [Array<String>]
        protected
        attr_accessor :m_tags
        
        # アイコン
        # 
        # @return [Icon]
        protected
        attr_accessor :m_icon
        
        # プラン
        # 
        # @return [Array<Iface>]
        protected
        attr_accessor :m_ifaces
        
        # サービスクラス
        # 
        # @return [String]
        protected
        attr_accessor :m_service_class
        
        # @private
        # @return [String]
        protected
        def _api_path()
          "/appliance"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key()
          "Appliance"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key_m()
          "Appliances"
        end
        
        # @private
        # @return [String]
        public
        def _id()
          get_id()
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新しいインスタンスを作成します.
        # 
        # @return [Appliance] this
        public
        def create()
          _create()
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        # 
        # @return [Appliance] this
        public
        def save()
          _save()
        end
        
        # 最新のリソース情報を再取得します.
        # 
        # @return [Appliance] this
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
        
        # アプライアンスを起動します.
        # 
        # @return [Appliance]
        public
        def boot()
          @_client.request("PUT", _api_path() + "/" + Saclient::Cloud::Util.url_encode(_id()) + "/power")
          self
        end
        
        # アプライアンスをシャットダウンします.
        # 
        # @return [Appliance]
        public
        def shutdown()
          @_client.request("DELETE", _api_path() + "/" + Saclient::Cloud::Util.url_encode(_id()) + "/power")
          self
        end
        
        # アプライアンスを強制停止します.
        # 
        # @return [Appliance]
        public
        def stop()
          @_client.request("DELETE", _api_path() + "/" + Saclient::Cloud::Util.url_encode(_id()) + "/power", {Force: true})
          self
        end
        
        # アプライアンスを強制再起動します.
        # 
        # @return [Appliance]
        public
        def reboot()
          @_client.request("PUT", _api_path() + "/" + Saclient::Cloud::Util.url_encode(_id()) + "/reset")
          self
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
        
        # ID
        # 
        # @return [String]
        public
        attr_reader :id
        def id() get_id end
        
        # @return [bool]
        protected
        attr_accessor :n_clazz
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_clazz()
          @m_clazz
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [String] v
        # @return [String]
        protected
        def set_clazz(v)
          @m_clazz = v
          @n_clazz = true
          @m_clazz
        end
        
        # クラス
        # 
        # @return [String]
        public
        attr_accessor :clazz
        def clazz() get_clazz end
        def clazz=(v) set_clazz(v) end
        
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
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [String] v
        # @return [String]
        protected
        def set_name(v)
          @m_name = v
          @n_name = true
          @m_name
        end
        
        # 名前
        # 
        # @return [String]
        public
        attr_accessor :name
        def name() get_name end
        def name=(v) set_name(v) end
        
        # @return [bool]
        protected
        attr_accessor :n_description
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_description()
          @m_description
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [String] v
        # @return [String]
        protected
        def set_description(v)
          @m_description = v
          @n_description = true
          @m_description
        end
        
        # 説明
        # 
        # @return [String]
        public
        attr_accessor :description
        def description() get_description end
        def description=(v) set_description(v) end
        
        # @return [bool]
        protected
        attr_accessor :n_tags
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [Array<String>]
        protected
        def get_tags()
          @m_tags
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [Array<String>] v
        # @return [Array<String>]
        protected
        def set_tags(v)
          @m_tags = v
          @n_tags = true
          @m_tags
        end
        
        # タグ
        # 
        # @return [Array<String>]
        public
        attr_accessor :tags
        def tags() get_tags end
        def tags=(v) set_tags(v) end
        
        # @return [bool]
        protected
        attr_accessor :n_icon
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [Icon]
        protected
        def get_icon()
          @m_icon
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [Icon] v
        # @return [Icon]
        protected
        def set_icon(v)
          @m_icon = v
          @n_icon = true
          @m_icon
        end
        
        # アイコン
        # 
        # @return [Icon]
        public
        attr_accessor :icon
        def icon() get_icon end
        def icon=(v) set_icon(v) end
        
        # @return [bool]
        protected
        attr_accessor :n_ifaces
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [Array<Iface>]
        protected
        def get_ifaces()
          @m_ifaces
        end
        
        # プラン
        # 
        # @return [Array<Iface>]
        public
        attr_reader :ifaces
        def ifaces() get_ifaces end
        
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
        
        # サービスクラス
        # 
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
          if (!r.nil? and r.key?("Class".to_sym))
            @m_clazz = (r["Class".to_sym]).nil? ? nil : r["Class".to_sym].to_s()
            @n_clazz = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("Name".to_sym))
            @m_name = (r["Name".to_sym]).nil? ? nil : r["Name".to_sym].to_s()
            @n_name = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("Description".to_sym))
            @m_description = (r["Description".to_sym]).nil? ? nil : r["Description".to_sym].to_s()
            @n_description = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("Tags".to_sym))
            if (r["Tags".to_sym]).nil?
              @m_tags = []
            else
              @m_tags = []
              for t in r["Tags".to_sym]
                v = nil
                v = (t).nil? ? nil : t.to_s()
                @m_tags << v
              end
            end
            @n_tags = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("Icon".to_sym))
            @m_icon = (r["Icon".to_sym]).nil? ? nil : Saclient::Cloud::Resource::Icon.new(@_client, r["Icon".to_sym])
            @n_icon = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("Interfaces".to_sym))
            if (r["Interfaces".to_sym]).nil?
              @m_ifaces = []
            else
              @m_ifaces = []
              for t in r["Interfaces".to_sym]
                v = nil
                v = (t).nil? ? nil : Saclient::Cloud::Resource::Iface.new(@_client, t)
                @m_ifaces << v
              end
            end
            @n_ifaces = false
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
          if withClean || @n_clazz
            ret["Class".to_sym] = @m_clazz
          end
          if withClean || @n_name
            ret["Name".to_sym] = @m_name
          end
          if withClean || @n_description
            ret["Description".to_sym] = @m_description
          end
          if withClean || @n_tags
            ret["Tags".to_sym] = []
            for r in @m_tags
              v = nil
              v = r
              ret["Tags".to_sym] << v
            end
          end
          if withClean || @n_icon
            ret["Icon".to_sym] = withClean ? ((@m_icon).nil? ? nil : @m_icon.api_serialize(withClean)) : ((@m_icon).nil? ? {ID: "0"} : @m_icon.api_serialize_id())
          end
          if withClean || @n_ifaces
            ret["Interfaces".to_sym] = []
            for r in @m_ifaces
              v = nil
              v = withClean ? ((r).nil? ? nil : r.api_serialize(withClean)) : ((r).nil? ? {ID: "0"} : r.api_serialize_id())
              ret["Interfaces".to_sym] << v
            end
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
