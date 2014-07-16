# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative '../util'

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
          return @_client
        end

        public

        # @return [Saclient::Cloud::Client]
        attr_reader :client

        def client
          get_client
        end

        protected

        # @private
        # @return [any]
        attr_accessor :_params

        public

        # @param [any] value
        # @param [String] key
        # @return [void]
        def set_param(key, value)
          @_params[key.to_sym] = value
        end

        protected

        # @private
        # @return [String]
        def _api_path
          return nil
        end

        # @private
        # @return [String]
        def _root_key
          return nil
        end

        # @private
        # @return [String]
        def _root_key_m
          return nil
        end

        public

        # @private
        # @return [String]
        def _id
          return nil
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        def initialize(client)
          @_client = client
          @_params = {}
        end

        protected

        # @return [bool]
        attr_accessor :is_new

        # @return [bool]
        attr_accessor :is_incomplete

        public

        # @param [any] r
        # @return [void]
        def api_deserialize(r)
        end

        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          return nil
        end

        protected

        # @return [any]
        def api_serialize_id
          id = _id
          return nil if (id).nil?
          r = {}
          r[:ID] = id
          return r
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @private
        # @return [Resource] this
        def _save
          r = api_serialize
          params = @_params
          @_params = {}
          keys = params.keys
          for k in keys
            v = params[k.to_sym]
            r[k.to_sym] = v
          end
          method = @is_new ? 'POST' : 'PUT'
          path = _api_path
          path += '/' + Saclient::Cloud::Util::url_encode(_id) if !@is_new
          q = {}
          q[_root_key.to_sym] = r
          result = @_client.request(method, path, q)
          api_deserialize(result[_root_key.to_sym])
          return self
        end

        public

        # このローカルオブジェクトのIDと対応するリソースの削除リクエストをAPIに送信します.
        #
        # @return [void]
        def destroy
          return nil if @is_new
          path = _api_path + '/' + Saclient::Cloud::Util::url_encode(_id)
          @_client.request('DELETE', path)
        end

        protected

        # 最新のリソース情報を再取得します.
        #
        # @private
        # @return [Resource] this
        def _reload
          result = @_client.request('GET', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id))
          api_deserialize(result[_root_key.to_sym])
          return self
        end

        public

        # @return [any]
        def dump
          return api_serialize(true)
        end

      end

    end
  end
end
