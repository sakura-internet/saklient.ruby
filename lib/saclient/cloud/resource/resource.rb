# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative '../util.rb'

module Saclient
  module Cloud
    module Resource
      
      # @ignore
      class Resource
        
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
        
        # @private
        # @return [String]
        public
        def _id()
          nil
        end
        
        # @private
        # @param [Saclient::Cloud::Client] client
        public
        def initialize(client)
          @_client = client
        end
        
        # @return [bool]
        protected
        attr_accessor :is_incomplete
        
        # @param [any] r
        public
        def api_deserialize(r)
        end
        
        # @param [bool] withClean
        # @return [any]
        public
        def api_serialize(withClean=false)
          nil
        end
        
        # @return [any]
        protected
        def api_serialize_id()
          id = _id()
          if (id).nil?
            nil
          end
          r = {}
          r["ID".to_sym] = id
          r
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新しいインスタンスを作成します.
        # 
        # @private
        # @return [Resource] this
        protected
        def _create()
          self
        end
        
        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        # 
        # @private
        # @return [Resource] this
        protected
        def _save()
          r = {}
          r[_root_key().to_sym] = api_serialize()
          result = @_client.request("PUT", _api_path() + "/" + Saclient::Cloud::Util.url_encode(_id()), r)
          api_deserialize(result[_root_key().to_sym])
          self
        end
        
        # 最新のリソース情報を再取得します.
        # 
        # @private
        # @return [Resource] this
        protected
        def _reload()
          result = @_client.request("GET", _api_path() + "/" + Saclient::Cloud::Util.url_encode(_id()))
          api_deserialize(result[_root_key().to_sym])
          self
        end
        
        # @return [any]
        public
        def dump()
          api_serialize()
        end
        
      end
      
    end
  end
end
