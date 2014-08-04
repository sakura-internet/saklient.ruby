# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/appliance'

module Saclient
  module Cloud
    module Model

      # アプライアンスを検索するための機能を備えたクラス.
      class Model_Appliance < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/appliance'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Appliance'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Appliances'
        end

        # @private
        # @return [String]
        def _class_name
          return 'Appliance'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_Appliance] this
        def offset(offset)
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_Appliance] this
        def limit(count)
          return _limit(count)
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model_Appliance]
        def filter_by(key, value, multiple = false)
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Appliance] this
        def reset
          return _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Appliance] リソースオブジェクト
        def get_by_id(id)
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::Appliance>] リソースオブジェクトの配列
        def find
          return Saclient::Cloud::Util::cast_array(_find, nil)
        end

        # 指定した文字列を名前に含むアプライアンスに絞り込みます.
        #
        # @param [String] name
        # @return [Model_Appliance]
        def with_name_like(name)
          _filter_by('Name', name)
          return self
        end

        # 指定したタグを持つアプライアンスに絞り込みます.
        #
        # @param [String] tag
        # @return [Model_Appliance]
        def with_tag(tag)
          _filter_by('Tags.Name', tag, true)
          return self
        end

        # 指定したタグを持つアプライアンスに絞り込みます.
        #
        # @param [Array<String>] tags
        # @return [Model_Appliance]
        def with_tags(tags)
          _filter_by('Tags.Name', tags, true)
          return self
        end

      end

    end
  end
end
