# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'common_service_provider'

module Saklient
  module Cloud
    module Resources

      # 共通サービス契約の実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class CommonServiceItem < Saklient::Cloud::Resources::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

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

        # 共通サービスプロバイダ情報
        #
        # @return [CommonServiceProvider]
        attr_accessor :m_provider

        # 設定の生データ
        #
        # @return [any]
        attr_accessor :m_raw_settings

        # @private
        # @return [String]
        attr_accessor :m_raw_settings_hash

        # ステータスの生データ
        #
        # @return [any]
        attr_accessor :m_raw_status

        # @private
        # @return [String]
        def _api_path
          return '/commonserviceitem'
        end

        # @private
        # @return [String]
        def _root_key
          return 'CommonServiceItem'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'CommonServiceItems'
        end

        public

        # @private
        # @return [String]
        def _class_name
          return 'CommonServiceItem'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
        #
        # @return [CommonServiceItem] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [CommonServiceItem] this
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

        # @private
        # @param [any] query
        # @return [void]
        def _on_before_save(query)
          Saklient::Util::set_by_path(query, 'OriginalSettingsHash', get_raw_settings_hash)
        end

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
        attr_accessor :n_name

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_name
          return @m_name
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_name(v)
          Saklient::Util::validate_type(v, 'String')
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
          Saklient::Util::validate_type(v, 'Icon')
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
        attr_accessor :n_provider

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [CommonServiceProvider]
        def get_provider
          return @m_provider
        end

        public

        # 共通サービスプロバイダ情報
        #
        # @return [CommonServiceProvider]
        attr_reader :provider

        def provider
          get_provider
        end

        protected

        # @return [bool]
        attr_accessor :n_raw_settings

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [any]
        def get_raw_settings
          @n_raw_settings = true
          return @m_raw_settings
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [any] v
        # @return [any]
        def set_raw_settings(v)
          @m_raw_settings = v
          @n_raw_settings = true
          return @m_raw_settings
        end

        public

        # 設定の生データ
        #
        # @return [any]
        attr_accessor :raw_settings

        def raw_settings
          get_raw_settings
        end

        def raw_settings=(v)
          set_raw_settings(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_raw_settings_hash

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_raw_settings_hash
          return @m_raw_settings_hash
        end

        public

        # @private
        # @return [String]
        attr_reader :raw_settings_hash

        def raw_settings_hash
          get_raw_settings_hash
        end

        protected

        # @return [bool]
        attr_accessor :n_raw_status

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [any]
        def get_raw_status
          return @m_raw_status
        end

        public

        # ステータスの生データ
        #
        # @return [any]
        attr_reader :raw_status

        def raw_status
          get_raw_status
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
            @m_icon = (Saklient::Util::get_by_path(r, 'Icon')).nil? ? nil : Icon.new(@_client, Saklient::Util::get_by_path(r, 'Icon'))
          else
            @m_icon = nil
            @is_incomplete = true
          end
          @n_icon = false
          if Saklient::Util::exists_path(r, 'CommonServiceProvider')
            @m_provider = (Saklient::Util::get_by_path(r, 'CommonServiceProvider')).nil? ? nil : Saklient::Cloud::Resources::CommonServiceProvider.new(@_client, Saklient::Util::get_by_path(r, 'CommonServiceProvider'))
          else
            @m_provider = nil
            @is_incomplete = true
          end
          @n_provider = false
          if Saklient::Util::exists_path(r, 'Settings')
            @m_raw_settings = Saklient::Util::get_by_path(r, 'Settings')
          else
            @m_raw_settings = nil
            @is_incomplete = true
          end
          @n_raw_settings = false
          if Saklient::Util::exists_path(r, 'SettingsHash')
            @m_raw_settings_hash = (Saklient::Util::get_by_path(r, 'SettingsHash')).nil? ? nil : Saklient::Util::get_by_path(r, 'SettingsHash').to_s
          else
            @m_raw_settings_hash = nil
            @is_incomplete = true
          end
          @n_raw_settings_hash = false
          if Saklient::Util::exists_path(r, 'Status')
            @m_raw_status = Saklient::Util::get_by_path(r, 'Status')
          else
            @m_raw_status = nil
            @is_incomplete = true
          end
          @n_raw_status = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          missing = []
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
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
          Saklient::Util::set_by_path(ret, 'CommonServiceProvider', withClean ? ((@m_provider).nil? ? nil : @m_provider.api_serialize(withClean)) : ((@m_provider).nil? ? { ID: '0' } : @m_provider.api_serialize_id)) if withClean || @n_provider
          Saklient::Util::set_by_path(ret, 'Settings', @m_raw_settings) if withClean || @n_raw_settings
          Saklient::Util::set_by_path(ret, 'SettingsHash', @m_raw_settings_hash) if withClean || @n_raw_settings_hash
          Saklient::Util::set_by_path(ret, 'Status', @m_raw_status) if withClean || @n_raw_status
          raise Saklient::Errors::SaklientException.new('required_field', 'Required fields must be set before the CommonServiceItem creation: ' + missing.join(', ')) if missing.length > 0
          return ret
        end

      end

    end
  end
end
