# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'disk_plan'
require_relative 'server'
require_relative '../enums/escope'

module Saclient
  module Cloud
    module Resource

      # アーカイブのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Archive < Saclient::Cloud::Resource::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # スコープ
        #
        # @return [String]
        attr_accessor :m_scope

        # 名前
        #
        # @return [String]
        attr_accessor :m_name

        # 説明
        #
        # @return [String]
        attr_accessor :m_description

        # タグ
        #
        # @return [Array<String>]
        attr_accessor :m_tags

        # アイコン
        #
        # @return [Icon]
        attr_accessor :m_icon

        # サイズ[MiB]
        #
        # @return [Integer]
        attr_accessor :m_size_mib

        # サービスクラス
        #
        # @return [String]
        attr_accessor :m_service_class

        # プラン
        #
        # @return [DiskPlan]
        attr_accessor :m_plan

        # @private
        # @return [String]
        def _api_path
          return '/archive'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Archive'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Archives'
        end

        public

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Archive] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Archive] this
        def reload
          return _reload
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end

        protected

        # @return [Integer]
        def get_size_gib
          return get_size_mib >> 10
        end

        public

        # サイズ[GiB]
        #
        # @return [Integer]
        attr_reader :size_gib

        def size_gib
          get_size_gib
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

        # ID
        #
        # @return [String]
        attr_reader :id

        def id
          get_id
        end

        protected

        # @return [bool]
        attr_accessor :n_scope

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_scope
          return @m_scope
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_scope(v)
          @m_scope = v
          @n_scope = true
          return @m_scope
        end

        public

        # スコープ
        #
        # @return [String]
        attr_accessor :scope

        def scope
          get_scope
        end

        def scope=(v)
          set_scope(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_name

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_name
          return @m_name
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_name(v)
          @m_name = v
          @n_name = true
          return @m_name
        end

        public

        # 名前
        #
        # @return [String]
        attr_accessor :name

        def name
          get_name
        end

        def name=(v)
          set_name(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_description

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_description
          return @m_description
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_description(v)
          @m_description = v
          @n_description = true
          return @m_description
        end

        public

        # 説明
        #
        # @return [String]
        attr_accessor :description

        def description
          get_description
        end

        def description=(v)
          set_description(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_tags

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Array<String>]
        def get_tags
          return @m_tags
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Array<String>] v
        # @return [Array<String>]
        def set_tags(v)
          @m_tags = v
          @n_tags = true
          return @m_tags
        end

        public

        # タグ
        #
        # @return [Array<String>]
        attr_accessor :tags

        def tags
          get_tags
        end

        def tags=(v)
          set_tags(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_icon

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Icon]
        def get_icon
          return @m_icon
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Icon] v
        # @return [Icon]
        def set_icon(v)
          @m_icon = v
          @n_icon = true
          return @m_icon
        end

        public

        # アイコン
        #
        # @return [Icon]
        attr_accessor :icon

        def icon
          get_icon
        end

        def icon=(v)
          set_icon(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_size_mib

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Integer]
        def get_size_mib
          return @m_size_mib
        end

        public

        # サイズ[MiB]
        #
        # @return [Integer]
        attr_reader :size_mib

        def size_mib
          get_size_mib
        end

        protected

        # @return [bool]
        attr_accessor :n_service_class

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_service_class
          return @m_service_class
        end

        public

        # サービスクラス
        #
        # @return [String]
        attr_reader :service_class

        def service_class
          get_service_class
        end

        protected

        # @return [bool]
        attr_accessor :n_plan

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [DiskPlan]
        def get_plan
          return @m_plan
        end

        public

        # プラン
        #
        # @return [DiskPlan]
        attr_reader :plan

        def plan
          get_plan
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
          if !r.nil? && r.key?(:Scope)
            @m_scope = (r[:Scope]).nil? ? nil : r[:Scope].to_s
          else
            @m_scope = nil
            @is_incomplete = true
          end
          @n_scope = false
          if !r.nil? && r.key?(:Name)
            @m_name = (r[:Name]).nil? ? nil : r[:Name].to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if !r.nil? && r.key?(:Description)
            @m_description = (r[:Description]).nil? ? nil : r[:Description].to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if !r.nil? && r.key?(:Tags)
            if (r[:Tags]).nil?
              @m_tags = []
            else
              @m_tags = []
              for t in r[:Tags]
                v = nil
                v = (t).nil? ? nil : t.to_s
                @m_tags << v
              end
            end
          else
            @m_tags = nil
            @is_incomplete = true
          end
          @n_tags = false
          if !r.nil? && r.key?(:Icon)
            @m_icon = (r[:Icon]).nil? ? nil : Saclient::Cloud::Resource::Icon.new(@_client, r[:Icon])
          else
            @m_icon = nil
            @is_incomplete = true
          end
          @n_icon = false
          if !r.nil? && r.key?(:SizeMB)
            @m_size_mib = (r[:SizeMB]).nil? ? nil : (r[:SizeMB].to_s).to_i(10)
          else
            @m_size_mib = nil
            @is_incomplete = true
          end
          @n_size_mib = false
          if !r.nil? && r.key?(:ServiceClass)
            @m_service_class = (r[:ServiceClass]).nil? ? nil : r[:ServiceClass].to_s
          else
            @m_service_class = nil
            @is_incomplete = true
          end
          @n_service_class = false
          if !r.nil? && r.key?(:Plan)
            @m_plan = (r[:Plan]).nil? ? nil : Saclient::Cloud::Resource::DiskPlan.new(@_client, r[:Plan])
          else
            @m_plan = nil
            @is_incomplete = true
          end
          @n_plan = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:Scope] = @m_scope if withClean || @n_scope
          ret[:Name] = @m_name if withClean || @n_name
          ret[:Description] = @m_description if withClean || @n_description
          if withClean || @n_tags
            ret[:Tags] = []
            for r in @m_tags
              v = nil
              v = r
              ret[:Tags] << v
            end
          end
          ret[:Icon] = withClean ? ((@m_icon).nil? ? nil : @m_icon.api_serialize(withClean)) : ((@m_icon).nil? ? { ID: '0' } : @m_icon.api_serialize_id) if withClean || @n_icon
          ret[:SizeMB] = @m_size_mib if withClean || @n_size_mib
          ret[:ServiceClass] = @m_service_class if withClean || @n_service_class
          ret[:Plan] = withClean ? ((@m_plan).nil? ? nil : @m_plan.api_serialize(withClean)) : ((@m_plan).nil? ? { ID: '0' } : @m_plan.api_serialize_id) if withClean || @n_plan
          return ret
        end

      end

    end
  end
end
