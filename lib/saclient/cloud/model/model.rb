# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative '../resource/resource.rb'

module Saclient
  module Cloud
    module Model
      
      # @ignore
      class Model
        
        # @private
        # @return [Saclient::Cloud::Client]
        protected
        attr_accessor :_client
        
        # @return [Saclient::Cloud::Client]
        protected
        def get_client()
          @_client
        end
        
        # @return [Saclient::Cloud::Client]
        public
        attr_reader :client
        def client() get_client end
        
        # @private
        # @return [TQueryParams]
        protected
        attr_accessor :_params
        
        # @return [TQueryParams]
        protected
        def get_params()
          @_params
        end
        
        # @return [TQueryParams]
        public
        attr_reader :params
        def params() get_params end
        
        # @private
        # @return [Integer]
        protected
        attr_accessor :_total
        
        # @return [Integer]
        protected
        def get_total()
          @_total
        end
        
        # @return [Integer]
        public
        attr_reader :total
        def total() get_total end
        
        # @private
        # @return [Integer]
        protected
        attr_accessor :_count
        
        # @return [Integer]
        protected
        def get_count()
          @_count
        end
        
        # @return [Integer]
        public
        attr_reader :count
        def count() get_count end
        
        # @private
        # @return [String]
        protected
        def _api_path()
          nil
        end
        
        # @private
        # @return [String]
        protected
        def _root_key()
          nil
        end
        
        # @private
        # @return [String]
        protected
        def _root_key_m()
          nil
        end
        
        # @param [Saclient::Cloud::Client] client
        public
        def initialize(client)
          @_client = client
          @_params = {}
          @_total = nil
          @_count = nil
        end
        
        # 次に取得するリストの開始オフセットを指定します.
        # 
        # @private
        # @param [Integer] offset オフセット
        # @return [Model] this
        protected
        def _offset(offset)
          @_params[:_begin] = offset
          self
        end
        
        # 次に取得するリストの上限レコード数を指定します.
        # 
        # @private
        # @param [Integer] count 上限レコード数
        # @return [Model] this
        protected
        def _limit(count)
          @_params[:_count] = count
          self
        end
        
        # 次のリクエストのために設定されているステートをすべて破棄します.
        # 
        # @private
        # @return [Model] this
        protected
        def _reset()
          @_params = {}
          @_total = 0
          @_count = 0
          self
        end
        
        # 指定したIDを持つ唯一のリソースを取得します.
        # 
        # @private
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Resource] リソースオブジェクト
        protected
        def _get(id)
          params = @_params
          _reset()
          result = @_client.request("GET", _api_path() + "/" + Saclient::Cloud::Util.url_encode(id), params)
          @_total = 1
          @_count = 1
          record = result[_root_key().to_sym]
          Saclient::Cloud::Util.create_class_instance("saclient.cloud.resource." + _root_key(), [@_client, record])
        end
        
        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        # 
        # @private
        # @return [Array<Saclient::Cloud::Resource::Resource>] リソースオブジェクトの配列
        protected
        def _find()
          params = @_params
          _reset()
          result = @_client.request("GET", _api_path(), params)
          @_total = result["Total".to_sym]
          @_count = result["Count".to_sym]
          records = result[_root_key_m().to_sym]
          data = []
          for record in records
            i = Saclient::Cloud::Util.create_class_instance("saclient.cloud.resource." + _root_key(), [@_client, record])
            data << i
          end
          data
        end
        
        # リソースの検索リクエストを実行し, 唯一のリソースを取得します.
        # 
        # @private
        # @return [Saclient::Cloud::Resource::Resource] リソースオブジェクト
        protected
        def _find_one()
          params = @_params
          _reset()
          result = @_client.request("GET", _api_path(), params)
          @_total = result["Total".to_sym]
          @_count = result["Count".to_sym]
          if @_total == 0
            nil
          end
          records = result[_root_key_m().to_sym]
          Saclient::Cloud::Util.create_class_instance("saclient.cloud.resource." + _root_key(), [@_client, records[0]])
        end
        
        # @private
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        protected
        def _filter_by(key, value, multiple=false)
          if !(!@_params.nil? and @_params.key?("Filter".to_sym))
            @_params["Filter".to_sym] = {}
          end
          filter = @_params["Filter".to_sym]
          if multiple
            if !(!filter.nil? and filter.key?(key.to_sym))
              filter[key.to_sym] = []
            end
            values = filter[key.to_sym]
            values << value
          else
            filter[key.to_sym] = value
          end
        end
        
      end
      
    end
  end
end
