# -*- encoding: UTF-8 -*-

require_relative 'model.rb'
require_relative '../resource/disk_plan.rb'

module Saclient
  module Cloud
    module Model

      # ディスクのプランを検索するための機能を備えたクラス.
      class Model_DiskPlan < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          '/product/disk'
        end

        # @private
        # @return [String]
        def _root_key
          'DiskPlan'
        end

        # @private
        # @return [String]
        def _root_key_m
          'DiskPlans'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_DiskPlan] this
        def offset(offset)
          _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_DiskPlan] this
        def limit(count)
          _limit(count)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_DiskPlan] this
        def reset
          _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::DiskPlan] リソースオブジェクト
        def get(id)
          _get(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::DiskPlan>] リソースオブジェクトの配列
        def find
          _find
        end

      end

    end
  end
end
