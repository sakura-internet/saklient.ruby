# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'

module Saclient
  module Cloud
    module Resource

      # アイコンのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Icon < Saclient::Cloud::Resource::Resource

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

        # URL
        #
        # @return [String]
        attr_accessor :m_url

        # @private
        # @return [String]
        def _api_path
          return '/icon'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Icon'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Icons'
        end

        public

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Icon] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Icon] this
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
        attr_accessor :n_url

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_url
          return @m_url
        end

        public

        # URL
        #
        # @return [String]
        attr_reader :url

        def url
          get_url
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
          if Saclient::Util::exists_path(r, 'Name')
            @m_name = (Saclient::Util::get_by_path(r, 'Name')).nil? ? nil : Saclient::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saclient::Util::exists_path(r, 'URL')
            @m_url = (Saclient::Util::get_by_path(r, 'URL')).nil? ? nil : Saclient::Util::get_by_path(r, 'URL').to_s
          else
            @m_url = nil
            @is_incomplete = true
          end
          @n_url = false
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
          Saclient::Util::set_by_path(ret, 'Name', @m_name) if withClean || @n_name
          Saclient::Util::set_by_path(ret, 'URL', @m_url) if withClean || @n_url
          return ret
        end

      end

    end
  end
end
