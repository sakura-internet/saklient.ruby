# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative '../util.rb'

module Saclient
  module Cloud
    module Resource

      # @ignore
      class Resource

        protected

        # @private
        # @return [Saclient::Cloud::Client]
        attr_accessor :_client

        # @return [Saclient::Cloud::Client]
        def get_client
          @_client
        end

        public

        # @return [Saclient::Cloud::Client]
        attr_reader :client

        def client
          get_client
        end

        protected

        # @private
        # @return [String]
        def _api_path
          nil
        end

        # @private
        # @return [String]
        def _root_key
          nil
        end

        # @private
        # @return [String]
        def _root_key_m
          nil
        end

        public

        # @private
        # @return [String]
        def _id
          nil
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        def initialize(client)
          @_client = client
        end

        protected

        # @return [bool]
        attr_accessor :is_new

        # @return [bool]
        attr_accessor :is_incomplete

        public

        # @param [any] r
        def api_deserialize(r)
        end

        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          nil
        end

        protected

        # @return [any]
        def api_serialize_id
          id = _id
          nil if (id).nil?
          r = {}
          r[:ID] = id
          r
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @private
        # @return [Resource] this
        def _save
          r = {}
          r[_root_key.to_sym] = api_serialize
          method = @is_new ? 'POST' : 'PUT'
          path = _api_path
          path += '/' + Saclient::Cloud::Util.url_encode(_id) if !@is_new
          result = @_client.request(method, path, r)
          api_deserialize(result[_root_key.to_sym])
          self
        end

        public

        # このローカルオブジェクトのIDと対応するリソースの削除リクエストをAPIに送信します.
        def destroy
          nil if @is_new
          path = _api_path + '/' + Saclient::Cloud::Util.url_encode(_id)
          @_client.request('DELETE', path)
        end

        protected

        # 最新のリソース情報を再取得します.
        #
        # @private
        # @return [Resource] this
        def _reload
          result = @_client.request('GET', _api_path + '/' + Saclient::Cloud::Util.url_encode(_id))
          api_deserialize(result[_root_key.to_sym])
          self
        end

        public

        # @return [any]
        def dump
          api_serialize
        end

      end

    end
  end
end
