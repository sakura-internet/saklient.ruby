# -*- encoding: UTF-8 -*-

require_relative 'model.rb'
require_relative '../resource/internet_plan.rb'

module Saclient
  module Cloud
    module Model
      
      # ルータのプランを検索するための機能を備えたクラス.
      class Model_InternetPlan < Saclient::Cloud::Model::Model
        
        # @private
        # @return [String]
        def _api_path()
          "/product/internet"
        end
        
        # @private
        # @return [String]
        def _root_key()
          "InternetPlan"
        end
        
        # @private
        # @return [String]
        def _root_key_m()
          "InternetPlans"
        end
        
        # 次に取得するリストの開始オフセットを指定します.
        # 
        # @param [Integer] offset オフセット
        # @return [Model_InternetPlan] this
        def offset(offset)
          _offset(offset)
        end
        
        # 次に取得するリストの上限レコード数を指定します.
        # 
        # @param [Integer] count 上限レコード数
        # @return [Model_InternetPlan] this
        def limit(count)
          _limit(count)
        end
        
        # 次のリクエストのために設定されているステートをすべて破棄します.
        # 
        # @return [Model_InternetPlan] this
        def reset()
          _reset()
        end
        
        # 指定したIDを持つ唯一のリソースを取得します.
        # 
        # @param [String] id
        # @return [Saclient::Cloud::Resource::InternetPlan] リソースオブジェクト
        def get(id)
          _get(id)
        end
        
        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        # 
        # @return [Array<Saclient::Cloud::Resource::InternetPlan>] リソースオブジェクトの配列
        def find()
          _find()
        end
        
      end
      
    end
  end
end
