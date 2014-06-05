# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative 'resource.rb'
require_relative 'icon.rb'
require_relative 'disk_plan.rb'
require_relative 'server.rb'

module Saclient
  module Cloud
    module Resource
      
      # アーカイブのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Archive < Saclient::Cloud::Resource::Resource
        
        # ID
        # 
        # @return [String]
        protected
        attr_accessor :m_id
        
        # スコープ
        # 
        # @return [String]
        protected
        attr_accessor :m_scope
        
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
        
        # サイズ[MiB]
        # 
        # @return [Integer]
        protected
        attr_accessor :m_size_mib
        
        # サービスクラス
        # 
        # @return [String]
        protected
        attr_accessor :m_service_class
        
        # プラン
        # 
        # @return [DiskPlan]
        protected
        attr_accessor :m_plan
        
        # @private
        # @return [String]
        protected
        def _api_path()
          "/archive"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key()
          "Archive"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key_m()
          "Archives"
        end
        
        # @private
        # @return [String]
        public
        def _id()
          get_id()
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新しいインスタンスを作成します.
        # 
        # @return [Archive] this
        public
        def create()
          _create()
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        # 
        # @return [Archive] this
        public
        def save()
          _save()
        end
        
        # 最新のリソース情報を再取得します.
        # 
        # @return [Archive] this
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
        
        # @return [Integer]
        protected
        def get_size_gib()
          get_size_mib() >> 10
        end
        
        # サイズ[GiB]
        # 
        # @return [Integer]
        public
        attr_reader :size_gib
        def size_gib() get_size_gib end
        
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
        attr_accessor :n_scope
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [String]
        protected
        def get_scope()
          @m_scope
        end
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @param [String] v
        # @return [String]
        protected
        def set_scope(v)
          @m_scope = v
          @n_scope = true
          @m_scope
        end
        
        # スコープ
        # 
        # @return [String]
        public
        attr_accessor :scope
        def scope() get_scope end
        def scope=(v) set_scope(v) end
        
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
        attr_accessor :n_size_mib
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [Integer]
        protected
        def get_size_mib()
          @m_size_mib
        end
        
        # サイズ[MiB]
        # 
        # @return [Integer]
        public
        attr_reader :size_mib
        def size_mib() get_size_mib end
        
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
        
        # @return [bool]
        protected
        attr_accessor :n_plan
        
        # (This method is generated in Translator_default#buildImpl)
        # 
        # @return [DiskPlan]
        protected
        def get_plan()
          @m_plan
        end
        
        # プラン
        # 
        # @return [DiskPlan]
        public
        attr_reader :plan
        def plan() get_plan end
        
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
          if (!r.nil? and r.key?("Scope".to_sym))
            @m_scope = (r["Scope".to_sym]).nil? ? nil : r["Scope".to_sym].to_s()
            @n_scope = false
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
          if (!r.nil? and r.key?("SizeMB".to_sym))
            @m_size_mib = (r["SizeMB".to_sym]).nil? ? nil : (r["SizeMB".to_sym].to_s()).to_i(10)
            @n_size_mib = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("ServiceClass".to_sym))
            @m_service_class = (r["ServiceClass".to_sym]).nil? ? nil : r["ServiceClass".to_sym].to_s()
            @n_service_class = false
          else
            @is_incomplete = false
          end
          if (!r.nil? and r.key?("Plan".to_sym))
            @m_plan = (r["Plan".to_sym]).nil? ? nil : Saclient::Cloud::Resource::DiskPlan.new(@_client, r["Plan".to_sym])
            @n_plan = false
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
          if withClean || @n_scope
            ret["Scope".to_sym] = @m_scope
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
          if withClean || @n_size_mib
            ret["SizeMB".to_sym] = @m_size_mib
          end
          if withClean || @n_service_class
            ret["ServiceClass".to_sym] = @m_service_class
          end
          if withClean || @n_plan
            ret["Plan".to_sym] = withClean ? ((@m_plan).nil? ? nil : @m_plan.api_serialize(withClean)) : ((@m_plan).nil? ? {ID: "0"} : @m_plan.api_serialize_id())
          end
          ret
        end
        
      end
      
    end
  end
end
