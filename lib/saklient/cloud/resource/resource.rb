# -*- encoding: UTF-8 -*-

require_relative '../../util'
require_relative '../client'

module Saklient
  module Cloud
    module Resource

      # @private
      class Resource

        protected

        # @private
        # @return [Saklient::Cloud::Client]
        attr_accessor :_client

        # @private
        # @return [Saklient::Cloud::Client]
        def get_client
          return @_client
        end

        public

        # @private
        # @return [Saklient::Cloud::Client]
        attr_reader :client

        def client
          get_client
        end

        protected

        # @private
        # @return [any]
        attr_accessor :_query

        public

        # @private
        # @param [String] key
        # @param [any] value
        # @return [void]
        def set_param(key, value)
          Saklient::Util::validate_type(key, 'String')
          @_query[key.to_sym] = value
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
        def _class_name
          return nil
        end

        # @private
        # @return [String]
        def _id
          return nil
        end

        # @private
        # @param [Saklient::Cloud::Client] client
        def initialize(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          @_client = client
          @_query = {}
        end

        protected

        # @private
        # @return [bool]
        attr_accessor :is_new

        # @private
        # @return [bool]
        attr_accessor :is_incomplete

        # @private
        # @param [any] r
        # @return [void]
        def _on_before_save(r)
        end

        # @private
        # @param [any] r
        # @param [any] root
        # @return [void]
        def _on_after_api_deserialize(r, root)
        end

        # @private
        # @param [any] r
        # @param [bool] withClean
        # @return [void]
        def _on_after_api_serialize(r, withClean)
          Saklient::Util::validate_type(withClean, 'bool')
        end

        # @private
        # @param [any] r
        # @return [void]
        def api_deserialize_impl(r)
        end

        public

        # @private
        # @param [any] obj
        # @param [bool] wrapped
        # @return [void]
        def api_deserialize(obj, wrapped = false)
          Saklient::Util::validate_type(wrapped, 'bool')
          root = nil
          record = nil
          rkey = _root_key
          if !(obj).nil?
            if !wrapped
              if !(rkey).nil?
                root = {}
                root[rkey.to_sym] = obj
              end
              record = obj
            else
              root = obj
              record = obj[rkey.to_sym]
            end
          end
          api_deserialize_impl(record)
          _on_after_api_deserialize(record, root)
        end

        protected

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          return nil
        end

        public

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          ret = api_serialize_impl(withClean)
          _on_after_api_serialize(ret, withClean)
          return ret
        end

        protected

        # @private
        # @return [any]
        def api_serialize_id
          id = _id
          return nil if (id).nil?
          r = {}
          r[:ID] = id
          return r
        end

        # @private
        # @param [String] name
        # @return [String]
        def normalize_field_name(name)
          Saklient::Util::validate_type(name, 'String')
          name.gsub!(/[A-Z]/) {|s| '_'+s.downcase}
          return name
        end

        public

        # @private
        # @param [String] name
        # @param [any] value
        # @return [void]
        def set_property(name, value)
          Saklient::Util::validate_type(name, 'String')
          name = normalize_field_name(name)
          instance_variable_set('@m_'+name, value)
          instance_variable_set('@n_'+name, true)
        end

        protected

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
        #
        # @private
        # @return [Resource] this
        def _save
          r = api_serialize
          query = @_query
          @_query = {}
          keys = query.keys
          for k in keys
            v = query[k.to_sym]
            r[k.to_sym] = v
          end
          _on_before_save(r)
          method = @is_new ? 'POST' : 'PUT'
          path = _api_path
          path += '/' + Saklient::Util::url_encode(_id) if !@is_new
          q = {}
          q[_root_key.to_sym] = r
          result = @_client.request(method, path, q)
          api_deserialize(result, true)
          return self
        end

        public

        # このローカルオブジェクトのIDと一致するリソースの削除リクエストをAPIに送信します.
        #
        # @return [void]
        def destroy
          return nil if @is_new
          path = _api_path + '/' + Saklient::Util::url_encode(_id)
          @_client.request('DELETE', path)
        end

        protected

        # 最新のリソース情報を再取得します.
        #
        # @private
        # @return [Resource] this
        def _reload
          result = @_client.request('GET', _api_path + '/' + Saklient::Util::url_encode(_id))
          api_deserialize(result, true)
          return self
        end

        public

        # このリソースが存在するかを調べます.
        #
        # @return [bool]
        def exists
          query = {}
          Saklient::Util::set_by_path(query, 'Filter.ID', [_id])
          Saklient::Util::set_by_path(query, 'Include', ['ID'])
          result = @_client.request('GET', _api_path, query)
          return result[:Count] == 1
        end

        # @private
        # @return [any]
        def dump
          return api_serialize(true)
        end

      end

    end
  end
end
