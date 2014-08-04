# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative '../resource/resource'

module Saclient
  module Cloud
    module Model

      # @ignore
      class Model

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
        # @return [TQueryParams]
        attr_accessor :_params

        # @return [TQueryParams]
        def get_params
          return @_params
        end

        public

        # @return [TQueryParams]
        attr_reader :params

        def params
          get_params
        end

        protected

        # @private
        # @return [Integer]
        attr_accessor :_total

        # @return [Integer]
        def get_total
          return @_total
        end

        public

        # @return [Integer]
        attr_reader :total

        def total
          get_total
        end

        protected

        # @private
        # @return [Integer]
        attr_accessor :_count

        # @return [Integer]
        def get_count
          return @_count
        end

        public

        # @return [Integer]
        attr_reader :count

        def count
          get_count
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

        # @private
        # @return [String]
        def _class_name
          return nil
        end

        public

        # @param [Saclient::Cloud::Client] client
        def initialize(client)
          @_client = client
          @_params = {}
          @_total = nil
          @_count = nil
        end

        protected

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @private
        # @param [Integer] offset オフセット
        # @return [Model] this
        def _offset(offset)
          @_params[:Begin] = offset
          return self
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @private
        # @param [Integer] count 上限レコード数
        # @return [Model] this
        def _limit(count)
          @_params[:Count] = count
          return self
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @private
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model]
        def _filter_by(key, value, multiple = false)
          @_params[:Filter] = {} if !(!@_params.nil? && @_params.key?(:Filter))
          filter = @_params[:Filter]
          if multiple
            filter[key.to_sym] = [] if !(!filter.nil? && filter.key?(key.to_sym))
            values = filter[key.to_sym]
            values << value
          else
            filter[key.to_sym] = value
          end
          return self
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @private
        # @return [Model] this
        def _reset
          @_params = {}
          @_total = 0
          @_count = 0
          return self
        end

        #  *
        #
        # @private
        # @return [Saclient::Cloud::Resource::Resource]
        def _create
          return Saclient::Util::create_class_instance('saclient.cloud.resource.' + _class_name, [@_client, nil])
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @private
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Resource] リソースオブジェクト
        def _get_by_id(id)
          params = @_params
          _reset
          result = @_client.request('GET', _api_path + '/' + Saclient::Util::url_encode(id), params)
          @_total = 1
          @_count = 1
          record = result[_root_key.to_sym]
          return Saclient::Util::create_class_instance('saclient.cloud.resource.' + _class_name, [@_client, record])
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @private
        # @return [Array<Saclient::Cloud::Resource::Resource>] リソースオブジェクトの配列
        def _find
          params = @_params
          _reset
          result = @_client.request('GET', _api_path, params)
          @_total = result[:Total]
          @_count = result[:Count]
          records = result[_root_key_m.to_sym]
          data = []
          for record in records
            i = Saclient::Util::create_class_instance('saclient.cloud.resource.' + _class_name, [@_client, record])
            data << i
          end
          return data
        end

        # リソースの検索リクエストを実行し, 唯一のリソースを取得します.
        #
        # @private
        # @return [Saclient::Cloud::Resource::Resource] リソースオブジェクト
        def _find_one
          params = @_params
          _reset
          result = @_client.request('GET', _api_path, params)
          @_total = result[:Total]
          @_count = result[:Count]
          return nil if @_total == 0
          records = result[_root_key_m.to_sym]
          return Saclient::Util::create_class_instance('saclient.cloud.resource.' + _class_name, [@_client, records[0]])
        end

      end

    end
  end
end
