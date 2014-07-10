# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'

module Saclient
  module Cloud
    module Resource

      # アイコンのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Icon < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_name

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
        # @return [String]
        def get_name
          return @m_name
        end

        public

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

        # @return [String]
        attr_reader :url

        def url
          get_url
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
          if !r.nil? && r.key?(:Name)
            @m_name = (r[:Name]).nil? ? nil : r[:Name].to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if !r.nil? && r.key?(:URL)
            @m_url = (r[:URL]).nil? ? nil : r[:URL].to_s
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
        def api_serialize(withClean = false)
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:Name] = @m_name if withClean || @n_name
          ret[:URL] = @m_url if withClean || @n_url
          return ret
        end

      end

    end
  end
end
