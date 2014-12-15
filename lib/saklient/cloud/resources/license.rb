# -*- encoding: UTF-8 -*-

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'license_info'

module Saklient
  module Cloud
    module Resources

      # ライセンスの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class License < Saklient::Cloud::Resources::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # 名前
        #
        # @return [String]
        attr_accessor :m_name

        # ライセンス種別情報
        #
        # @return [LicenseInfo]
        attr_accessor :m_info

        # @private
        # @return [String]
        def _api_path
          return '/license'
        end

        # @private
        # @return [String]
        def _root_key
          return 'License'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Licenses'
        end

        public

        # @private
        # @return [String]
        def _class_name
          return 'License'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
        #
        # @return [License] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [License] this
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
        attr_accessor :n_info

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [LicenseInfo]
        def get_info
          return @m_info
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [LicenseInfo] v
        # @return [LicenseInfo]
        def set_info(v)
          Saklient::Util::validate_type(v, 'Saklient::Cloud::Resources::LicenseInfo')
          raise Saklient::Errors::SaklientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saklient::Cloud::Resources::License#info') if !@is_new
          @m_info = v
          @n_info = true
          return @m_info
        end

        public

        # ライセンス種別情報
        #
        # @return [LicenseInfo]
        attr_accessor :info

        def info
          get_info
        end

        def info=(v)
          set_info(v)
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
          if Saklient::Util::exists_path(r, 'LicenseInfo')
            @m_info = (Saklient::Util::get_by_path(r, 'LicenseInfo')).nil? ? nil : Saklient::Cloud::Resources::LicenseInfo.new(@_client, Saklient::Util::get_by_path(r, 'LicenseInfo'))
          else
            @m_info = nil
            @is_incomplete = true
          end
          @n_info = false
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
          if withClean || @n_info
            Saklient::Util::set_by_path(ret, 'LicenseInfo', withClean ? ((@m_info).nil? ? nil : @m_info.api_serialize(withClean)) : ((@m_info).nil? ? { ID: '0' } : @m_info.api_serialize_id))
          else
            missing << 'info' if @is_new
          end
          raise Saklient::Errors::SaklientException.new('required_field', 'Required fields must be set before the License creation: ' + missing.join(', ')) if missing.length > 0
          return ret
        end

      end

    end
  end
end
