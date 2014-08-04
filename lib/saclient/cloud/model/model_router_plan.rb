# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/router_plan'

module Saclient
  module Cloud
    module Model

      # ルータのプランを検索するための機能を備えたクラス.
      class Model_RouterPlan < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/product/internet'
        end

        # @private
        # @return [String]
        def _root_key
          return 'InternetPlan'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'InternetPlans'
        end

        # @private
        # @return [String]
        def _class_name
          return 'RouterPlan'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_RouterPlan] this
        def offset(offset)
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_RouterPlan] this
        def limit(count)
          return _limit(count)
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model_RouterPlan]
        def filter_by(key, value, multiple = false)
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_RouterPlan] this
        def reset
          return _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::RouterPlan] リソースオブジェクト
        def get_by_id(id)
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::RouterPlan>] リソースオブジェクトの配列
        def find
          return Saclient::Cloud::Util::cast_array(_find, nil)
        end

      end

    end
  end
end
