# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'region'

module Saklient
  module Cloud
    module Resources

      # ブリッジの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Bridge < Saklient::Cloud::Resources::Resource

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

        # リージョン
        #
        # @return [Region]
        attr_accessor :m_region

        # @private
        # @return [String]
        def _api_path
          return '/bridge'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Bridge'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Bridges'
        end

        public

        # @private
        # @return [String]
        def _class_name
          return 'Bridge'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
        #
        # @return [Bridge] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Bridge] this
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
        attr_accessor :n_region

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [Region]
        def get_region
          return @m_region
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [Region] v
        # @return [Region]
        def set_region(v)
          Saklient::Util::validate_type(v, 'Saklient::Cloud::Resources::Region')
          raise Saklient::Errors::SaklientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saklient::Cloud::Resources::Bridge#region') if !@is_new
          @m_region = v
          @n_region = true
          return @m_region
        end

        public

        # リージョン
        #
        # @return [Region]
        attr_accessor :region

        def region
          get_region
        end

        def region=(v)
          set_region(v)
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
          if Saklient::Util::exists_path(r, 'Region')
            @m_region = (Saklient::Util::get_by_path(r, 'Region')).nil? ? nil : Saklient::Cloud::Resources::Region.new(@_client, Saklient::Util::get_by_path(r, 'Region'))
          else
            @m_region = nil
            @is_incomplete = true
          end
          @n_region = false
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
          Saklient::Util::set_by_path(ret, 'Region', withClean ? ((@m_region).nil? ? nil : @m_region.api_serialize(withClean)) : ((@m_region).nil? ? { ID: '0' } : @m_region.api_serialize_id)) if withClean || @n_region
          raise Saklient::Errors::SaklientException.new('required_field', 'Required fields must be set before the Bridge creation: ' + missing.join(', ')) if missing.length > 0
          return ret
        end

      end

    end
  end
end
