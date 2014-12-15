# -*- encoding: UTF-8 -*-

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative '../enums/escope'
require_relative '../enums/escript_class'

module Saklient
  module Cloud
    module Resources

      # スクリプトの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Script < Saklient::Cloud::Resources::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # スコープ {Saklient::Cloud::Enums::EScope}
        #
        # @return [String]
        attr_accessor :m_scope

        # クラス {Saklient::Cloud::Enums::EScriptClass}
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

        # タグ文字列の配列
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
        def _class_name
          return 'Script'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
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
        # @param [Saklient::Cloud::Client] client
        # @param [any] obj
        # @param [bool] wrapped
        def initialize(client, obj, wrapped = false)
          super(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(wrapped, 'bool')
          api_deserialize(obj, wrapped)
        end

        protected

        # @return [bool]
        attr_accessor :n_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
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
        # @private
        # @return [String]
        def get_scope
          return @m_scope
        end

        public

        # スコープ {Saklient::Cloud::Enums::EScope}
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
        # @private
        # @return [String]
        def get_clazz
          return @m_clazz
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_clazz(v)
          Saklient::Util::validate_type(v, 'String')
          @m_clazz = v
          @n_clazz = true
          return @m_clazz
        end

        public

        # クラス {Saklient::Cloud::Enums::EScriptClass}
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
        # @private
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
        # @private
        # @return [String]
        def get_description
          return @m_description
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_description(v)
          Saklient::Util::validate_type(v, 'String')
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
        # @private
        # @return [Array<String>]
        def get_tags
          @n_tags = true
          return @m_tags
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [Array<String>] v
        # @return [Array<String>]
        def set_tags(v)
          Saklient::Util::validate_type(v, 'Array')
          @m_tags = v
          @n_tags = true
          return @m_tags
        end

        public

        # タグ文字列の配列
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
        # @private
        # @return [Icon]
        def get_icon
          return @m_icon
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [Icon] v
        # @return [Icon]
        def set_icon(v)
          Saklient::Util::validate_type(v, 'Saklient::Cloud::Resources::Icon')
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
        # @private
        # @return [String]
        def get_content
          return @m_content
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_content(v)
          Saklient::Util::validate_type(v, 'String')
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
        # @private
        # @return [any]
        def get_annotation
          return @m_annotation
        end

        public

        # 注釈
        #
        # @return [any]
        attr_reader :annotation

        def annotation
          get_annotation
        end

        protected

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize_impl(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if Saklient::Util::exists_path(r, 'ID')
            @m_id = (Saklient::Util::get_by_path(r, 'ID')).nil? ? nil : Saklient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saklient::Util::exists_path(r, 'Scope')
            @m_scope = (Saklient::Util::get_by_path(r, 'Scope')).nil? ? nil : Saklient::Util::get_by_path(r, 'Scope').to_s
          else
            @m_scope = nil
            @is_incomplete = true
          end
          @n_scope = false
          if Saklient::Util::exists_path(r, 'Class')
            @m_clazz = (Saklient::Util::get_by_path(r, 'Class')).nil? ? nil : Saklient::Util::get_by_path(r, 'Class').to_s
          else
            @m_clazz = nil
            @is_incomplete = true
          end
          @n_clazz = false
          if Saklient::Util::exists_path(r, 'Name')
            @m_name = (Saklient::Util::get_by_path(r, 'Name')).nil? ? nil : Saklient::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saklient::Util::exists_path(r, 'Description')
            @m_description = (Saklient::Util::get_by_path(r, 'Description')).nil? ? nil : Saklient::Util::get_by_path(r, 'Description').to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if Saklient::Util::exists_path(r, 'Tags')
            if (Saklient::Util::get_by_path(r, 'Tags')).nil?
              @m_tags = []
            else
              @m_tags = []
              for t in Saklient::Util::get_by_path(r, 'Tags')
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
          if Saklient::Util::exists_path(r, 'Icon')
            @m_icon = (Saklient::Util::get_by_path(r, 'Icon')).nil? ? nil : Saklient::Cloud::Resources::Icon.new(@_client, Saklient::Util::get_by_path(r, 'Icon'))
          else
            @m_icon = nil
            @is_incomplete = true
          end
          @n_icon = false
          if Saklient::Util::exists_path(r, 'Content')
            @m_content = (Saklient::Util::get_by_path(r, 'Content')).nil? ? nil : Saklient::Util::get_by_path(r, 'Content').to_s
          else
            @m_content = nil
            @is_incomplete = true
          end
          @n_content = false
          if Saklient::Util::exists_path(r, 'Remark')
            @m_annotation = Saklient::Util::get_by_path(r, 'Remark')
          else
            @m_annotation = nil
            @is_incomplete = true
          end
          @n_annotation = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          missing = []
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saklient::Util::set_by_path(ret, 'Scope', @m_scope) if withClean || @n_scope
          Saklient::Util::set_by_path(ret, 'Class', @m_clazz) if withClean || @n_clazz
          if withClean || @n_name
            Saklient::Util::set_by_path(ret, 'Name', @m_name)
          else
            missing << 'name' if @is_new
          end
          Saklient::Util::set_by_path(ret, 'Description', @m_description) if withClean || @n_description
          if withClean || @n_tags
            Saklient::Util::set_by_path(ret, 'Tags', [])
            for r1 in @m_tags
              v = nil
              v = r1
              ret[:Tags] << v
            end
          end
          Saklient::Util::set_by_path(ret, 'Icon', withClean ? ((@m_icon).nil? ? nil : @m_icon.api_serialize(withClean)) : ((@m_icon).nil? ? { ID: '0' } : @m_icon.api_serialize_id)) if withClean || @n_icon
          if withClean || @n_content
            Saklient::Util::set_by_path(ret, 'Content', @m_content)
          else
            missing << 'content' if @is_new
          end
          Saklient::Util::set_by_path(ret, 'Remark', @m_annotation) if withClean || @n_annotation
          raise Saklient::Errors::SaklientException.new('required_field', 'Required fields must be set before the Script creation: ' + missing.join(', ')) if missing.length > 0
          return ret
        end

      end

    end
  end
end
