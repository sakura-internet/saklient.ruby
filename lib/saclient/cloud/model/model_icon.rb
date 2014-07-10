# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/icon'

module Saclient
  module Cloud
    module Model

      # アイコンを検索するための機能を備えたクラス.
      class Model_Icon < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/icon'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Icon'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Icons'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_Icon] this
        def offset(offset)
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_Icon] this
        def limit(count)
          return _limit(count)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Icon] this
        def reset
          return _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Icon] リソースオブジェクト
        def get(id)
          return _get(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::Icon>] リソースオブジェクトの配列
        def find
          return _find
        end

        # 指定した文字列を名前に含むアイコンに絞り込みます.
        #
        # @param [String] name
        # @return [Model_Icon]
        def with_name_like(name)
          _filter_by('Name', name)
          return self
        end

        # 指定したタグを持つアイコンに絞り込みます.
        #
        # @param [String] tag
        # @return [Model_Icon]
        def with_tag(tag)
          _filter_by('Tags.Name', tag, true)
          return self
        end

      end

    end
  end
end
