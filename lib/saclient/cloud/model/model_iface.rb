# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/iface'

module Saclient
  module Cloud
    module Model

      # インタフェースを検索するための機能を備えたクラス.
      class Model_Iface < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/interface'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Interface'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Interfaces'
        end

        # @private
        # @return [String]
        def _class_name
          return 'Iface'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_Iface] this
        def offset(offset)
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_Iface] this
        def limit(count)
          return _limit(count)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Iface] this
        def reset
          return _reset
        end

        # *
        #
        # @return [Saclient::Cloud::Resource::Iface]
        def create
          return _create
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Iface] リソースオブジェクト
        def get_by_id(id)
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::Iface>] リソースオブジェクトの配列
        def find
          return _find
        end

      end

    end
  end
end
