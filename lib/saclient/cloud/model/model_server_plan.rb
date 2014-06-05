# -*- encoding: UTF-8 -*-

require_relative 'model.rb'
require_relative '../resource/server_plan.rb'

module Saclient
  module Cloud
    module Model
      
      # サーバのプランを検索するための機能を備えたクラス.
      class Model_ServerPlan < Saclient::Cloud::Model::Model
        
        # @private
        # @return [String]
        protected
        def _api_path()
          "/product/server"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key()
          "ServerPlan"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key_m()
          "ServerPlans"
        end
        
        # 次に取得するリストの開始オフセットを指定します.
        # 
        # @param [Integer] offset オフセット
        # @return [Model_ServerPlan] this
        public
        def offset(offset)
          _offset(offset)
        end
        
        # 次に取得するリストの上限レコード数を指定します.
        # 
        # @param [Integer] count 上限レコード数
        # @return [Model_ServerPlan] this
        public
        def limit(count)
          _limit(count)
        end
        
        # 次のリクエストのために設定されているステートをすべて破棄します.
        # 
        # @return [Model_ServerPlan] this
        public
        def reset()
          _reset()
        end
        
        # 指定したIDを持つ唯一のリソースを取得します.
        # 
        # @param [String] id
        # @return [Saclient::Cloud::Resource::ServerPlan] リソースオブジェクト
        public
        def get(id)
          _get(id)
        end
        
        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        # 
        # @return [Array<Saclient::Cloud::Resource::ServerPlan>] リソースオブジェクトの配列
        public
        def find()
          _find()
        end
        
        # 指定したスペックのプランを取得します.
        # 
        # @param [Integer] cores
        # @param [Integer] memoryGib
        # @return [Saclient::Cloud::Resource::ServerPlan]
        public
        def get_by_spec(cores, memoryGib)
          _filter_by("CPU", cores, true)
          _filter_by("MemoryMB", memoryGib * 1024, true)
          _find_one()
        end
        
      end
      
    end
  end
end
