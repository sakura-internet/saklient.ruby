# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'
require_relative 'icon'

module Saclient
  module Cloud
    module Resource

      # スクリプトのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Script < Saclient::Cloud::Resource::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # スコープ
        #
        # @return [String]
        attr_accessor :m_scope

        # クラス
        #
        # @return [String]
        attr_accessor :m_clazz

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

        # 内容
        #
        # @return [String]
        attr_accessor :m_content

        # 注釈
        #
        # @return [any]
        attr_accessor :m_annotation

        # @private
        # @return [String]
        def _api_path
          return '/note'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Note'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Notes'
        end

        public

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Script] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Script] this
        def reload
          return _reload
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          Saclient::Util::validate_type(client, 'Saclient::Cloud::Client')
          api_deserialize(r)
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

        public

        # スコープ
        #
        # @return [String]
        attr_reader :scope

        def scope
          get_scope
        end

        protected

        # @return [bool]
        attr_accessor :n_clazz

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_clazz
          return @m_clazz
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_clazz(v)
          Saclient::Util::validate_type(v, 'String')
          @m_clazz = v
          @n_clazz = true
          return @m_clazz
        end

        public

        # クラス
        #
        # @return [String]
        attr_accessor :clazz

        def clazz
          get_clazz
        end

        def clazz=(v)
          set_clazz(v)
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

        public

        # 名前
        #
        # @return [String]
        attr_reader :name

        def name
          get_name
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
          Saclient::Util::validate_type(v, 'String')
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
          Saclient::Util::validate_type(v, 'Array')
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
          Saclient::Util::validate_type(v, 'Saclient::Cloud::Resource::Icon')
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
        attr_accessor :n_content

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_content
          return @m_content
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_content(v)
          Saclient::Util::validate_type(v, 'String')
          @m_content = v
          @n_content = true
          return @m_content
        end

        public

        # 内容
        #
        # @return [String]
        attr_accessor :content

        def content
          get_content
        end

        def content=(v)
          set_content(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_annotation

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [any]
        def get_annotation
          return @m_annotation
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] v
        # @return [any]
        def set_annotation(v)
          @m_annotation = v
          @n_annotation = true
          return @m_annotation
        end

        public

        # 注釈
        #
        # @return [any]
        attr_accessor :annotation

        def annotation
          get_annotation
        end

        def annotation=(v)
          set_annotation(v)
        end

        protected

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize_impl(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if Saclient::Util::exists_path(r, 'ID')
            @m_id = (Saclient::Util::get_by_path(r, 'ID')).nil? ? nil : Saclient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saclient::Util::exists_path(r, 'Scope')
            @m_scope = (Saclient::Util::get_by_path(r, 'Scope')).nil? ? nil : Saclient::Util::get_by_path(r, 'Scope').to_s
          else
            @m_scope = nil
            @is_incomplete = true
          end
          @n_scope = false
          if Saclient::Util::exists_path(r, 'Class')
            @m_clazz = (Saclient::Util::get_by_path(r, 'Class')).nil? ? nil : Saclient::Util::get_by_path(r, 'Class').to_s
          else
            @m_clazz = nil
            @is_incomplete = true
          end
          @n_clazz = false
          if Saclient::Util::exists_path(r, 'Name')
            @m_name = (Saclient::Util::get_by_path(r, 'Name')).nil? ? nil : Saclient::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saclient::Util::exists_path(r, 'Description')
            @m_description = (Saclient::Util::get_by_path(r, 'Description')).nil? ? nil : Saclient::Util::get_by_path(r, 'Description').to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if Saclient::Util::exists_path(r, 'Tags')
            if (Saclient::Util::get_by_path(r, 'Tags')).nil?
              @m_tags = []
            else
              @m_tags = []
              for t in Saclient::Util::get_by_path(r, 'Tags')
                v1 = nil
                v1 = (t).nil? ? nil : t.to_s
                @m_tags << v1
              end
            end
          else
            @m_tags = nil
            @is_incomplete = true
          end
          @n_tags = false
          if Saclient::Util::exists_path(r, 'Icon')
            @m_icon = (Saclient::Util::get_by_path(r, 'Icon')).nil? ? nil : Saclient::Cloud::Resource::Icon.new(@_client, Saclient::Util::get_by_path(r, 'Icon'))
          else
            @m_icon = nil
            @is_incomplete = true
          end
          @n_icon = false
          if Saclient::Util::exists_path(r, 'Content')
            @m_content = (Saclient::Util::get_by_path(r, 'Content')).nil? ? nil : Saclient::Util::get_by_path(r, 'Content').to_s
          else
            @m_content = nil
            @is_incomplete = true
          end
          @n_content = false
          if Saclient::Util::exists_path(r, 'Remark')
            @m_annotation = Saclient::Util::get_by_path(r, 'Remark')
          else
            @m_annotation = nil
            @is_incomplete = true
          end
          @n_annotation = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saclient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saclient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saclient::Util::set_by_path(ret, 'Scope', @m_scope) if withClean || @n_scope
          Saclient::Util::set_by_path(ret, 'Class', @m_clazz) if withClean || @n_clazz
          Saclient::Util::set_by_path(ret, 'Name', @m_name) if withClean || @n_name
          Saclient::Util::set_by_path(ret, 'Description', @m_description) if withClean || @n_description
          if withClean || @n_tags
            Saclient::Util::set_by_path(ret, 'Tags', [])
            for r1 in @m_tags
              v = nil
              v = r1
              ret[:Tags] << v
            end
          end
          Saclient::Util::set_by_path(ret, 'Icon', withClean ? ((@m_icon).nil? ? nil : @m_icon.api_serialize(withClean)) : ((@m_icon).nil? ? { ID: '0' } : @m_icon.api_serialize_id)) if withClean || @n_icon
          Saclient::Util::set_by_path(ret, 'Content', @m_content) if withClean || @n_content
          Saclient::Util::set_by_path(ret, 'Remark', @m_annotation) if withClean || @n_annotation
          return ret
        end

      end

    end
  end
end
