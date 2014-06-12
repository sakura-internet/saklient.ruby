# -*- encoding: UTF-8 -*-

require_relative 'model.rb'
require_relative '../resource/archive.rb'

module Saclient
  module Cloud
    module Model

      # アーカイブを検索するための機能を備えたクラス.
      class Model_Archive < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          '/archive'
        end

        # @private
        # @return [String]
        def _root_key
          'Archive'
        end

        # @private
        # @return [String]
        def _root_key_m
          'Archives'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_Archive] this
        def offset(offset)
          _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_Archive] this
        def limit(count)
          _limit(count)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Archive] this
        def reset
          _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Archive] リソースオブジェクト
        def get(id)
          _get(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::Archive>] リソースオブジェクトの配列
        def find
          _find
        end

        # 指定した文字列を名前に含むアーカイブに絞り込みます.
        #
        # @param [String] name
        # @return [Model_Archive]
        def with_name_like(name)
          _filter_by('Name', name)
          self
        end

        # 指定したタグを持つアーカイブに絞り込みます.
        #
        # @param [String] tag
        # @return [Model_Archive]
        def with_tag(tag)
          _filter_by('Tags.Name', tag, true)
          self
        end

      end

    end
  end
end
