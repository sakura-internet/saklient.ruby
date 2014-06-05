# -*- encoding: UTF-8 -*-

require_relative 'model.rb'
require_relative '../resource/appliance.rb'

module Saclient
  module Cloud
    module Model
      
      # アプライアンスを検索するための機能を備えたクラス.
      class Model_Appliance < Saclient::Cloud::Model::Model
        
        # @private
        # @return [String]
        protected
        def _api_path()
          "/appliance"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key()
          "Appliance"
        end
        
        # @private
        # @return [String]
        protected
        def _root_key_m()
          "Appliances"
        end
        
        # 次に取得するリストの開始オフセットを指定します.
        # 
        # @param [Integer] offset オフセット
        # @return [Model_Appliance] this
        public
        def offset(offset)
          _offset(offset)
        end
        
        # 次に取得するリストの上限レコード数を指定します.
        # 
        # @param [Integer] count 上限レコード数
        # @return [Model_Appliance] this
        public
        def limit(count)
          _limit(count)
        end
        
        # 次のリクエストのために設定されているステートをすべて破棄します.
        # 
        # @return [Model_Appliance] this
        public
        def reset()
          _reset()
        end
        
        # 指定したIDを持つ唯一のリソースを取得します.
        # 
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Appliance] リソースオブジェクト
        public
        def get(id)
          _get(id)
        end
        
        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        # 
        # @return [Array<Saclient::Cloud::Resource::Appliance>] リソースオブジェクトの配列
        public
        def find()
          _find()
        end
        
        # 指定した文字列を名前に含むアプライアンスに絞り込みます.
        # 
        # @param [String] name
        # @return [Model_Appliance]
        public
        def with_name_like(name)
          _filter_by("Name", name)
          self
        end
        
        # 指定したタグを持つアプライアンスに絞り込みます.
        # 
        # @param [String] tag
        # @return [Model_Appliance]
        public
        def with_tag(tag)
          _filter_by("Tags.Name", tag, true)
          self
        end
        
      end
      
    end
  end
end
