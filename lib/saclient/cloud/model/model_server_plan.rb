# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/server_plan'

module Saclient
  module Cloud
    module Model

      # サーバのプランを検索するための機能を備えたクラス.
      class Model_ServerPlan < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/product/server'
        end

        # @private
        # @return [String]
        def _root_key
          return 'ServerPlan'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'ServerPlans'
        end

        # @private
        # @return [String]
        def _class_name
          return 'ServerPlan'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Fixnum] offset オフセット
        # @return [Model_ServerPlan] this
        def offset(offset)
          Saclient::Util::validate_type(offset, 'Fixnum')
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Fixnum] count 上限レコード数
        # @return [Model_ServerPlan] this
        def limit(count)
          Saclient::Util::validate_type(count, 'Fixnum')
          return _limit(count)
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model_ServerPlan]
        def filter_by(key, value, multiple = false)
          Saclient::Util::validate_type(key, 'String')
          Saclient::Util::validate_type(multiple, 'bool')
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_ServerPlan] this
        def reset
          return _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::ServerPlan] リソースオブジェクト
        def get_by_id(id)
          Saclient::Util::validate_type(id, 'String')
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::ServerPlan>] リソースオブジェクトの配列
        def find
          return _find
        end

        # 指定したスペックのプランを取得します.
        #
        # @param [Fixnum] cores
        # @param [Fixnum] memoryGib
        # @return [Saclient::Cloud::Resource::ServerPlan]
        def get_by_spec(cores, memoryGib)
          Saclient::Util::validate_type(cores, 'Fixnum')
          Saclient::Util::validate_type(memoryGib, 'Fixnum')
          _filter_by('CPU', cores, true)
          _filter_by('MemoryMB', memoryGib * 1024, true)
          return _find_one
        end

      end

    end
  end
end
