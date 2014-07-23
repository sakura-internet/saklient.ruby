# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/server'
require_relative '../resource/server_plan'

module Saclient
  module Cloud
    module Model

      # サーバを検索するための機能を備えたクラス.
      class Model_Server < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/server'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Server'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Servers'
        end

        # @private
        # @return [String]
        def _class_name
          return 'Server'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_Server] this
        def offset(offset)
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_Server] this
        def limit(count)
          return _limit(count)
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model_Server]
        def filter_by(key, value, multiple = false)
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Server] this
        def reset
          return _reset
        end

        # *
        #
        # @return [Saclient::Cloud::Resource::Server]
        def create
          return _create
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Server] リソースオブジェクト
        def get_by_id(id)
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::Server>] リソースオブジェクトの配列
        def find
          return _find
        end

        # 指定した文字列を名前に含むサーバに絞り込みます.
        #
        # @param [String] name
        # @return [Model_Server]
        def with_name_like(name)
          _filter_by('Name', name)
          return self
        end

        # 指定したタグを持つサーバに絞り込みます.
        #
        # @param [String] tag
        # @return [Model_Server]
        def with_tag(tag)
          _filter_by('Tags.Name', tag, true)
          return self
        end

        # 指定したタグを持つサーバに絞り込みます.
        #
        # @param [Saclient::Cloud::Resource::ServerPlan] plan
        # @return [Model_Server]
        def with_plan(plan)
          _filter_by('ServerPlan.ID', plan._id, true)
          return self
        end

        # インスタンスが指定した状態にあるサーバに絞り込みます.
        #
        # @param [String] status
        # @return [Model_Server]
        def with_instance_status(status)
          _filter_by('Instance.Status', status, true)
          return self
        end

      end

    end
  end
end
