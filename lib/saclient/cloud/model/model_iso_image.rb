# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/iso_image'
require_relative '../enums/escope'

module Saclient
  module Cloud
    module Model

      # ISOイメージを検索するための機能を備えたクラス.
      class Model_IsoImage < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/cdrom'
        end

        # @private
        # @return [String]
        def _root_key
          return 'CDROM'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'CDROMs'
        end

        # @private
        # @return [String]
        def _class_name
          return 'IsoImage'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_IsoImage] this
        def offset(offset)
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_IsoImage] this
        def limit(count)
          return _limit(count)
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model_IsoImage]
        def filter_by(key, value, multiple = false)
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_IsoImage] this
        def reset
          return _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::IsoImage] リソースオブジェクト
        def get_by_id(id)
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::IsoImage>] リソースオブジェクトの配列
        def find
          return _find
        end

        # 指定した文字列を名前に含むアーカイブに絞り込みます.
        #
        # @param [String] name
        # @return [Model_IsoImage]
        def with_name_like(name)
          _filter_by('Name', name)
          return self
        end

        # 指定したタグを持つアーカイブに絞り込みます.
        #
        # @param [String] tag
        # @return [Model_IsoImage]
        def with_tag(tag)
          _filter_by('Tags.Name', tag, true)
          return self
        end

        # 指定したサイズのアーカイブに絞り込みます.
        #
        # @param [Integer] sizeGib
        # @return [Model_IsoImage]
        def with_size_gib(sizeGib)
          _filter_by('SizeMB', sizeGib * 1024)
          return self
        end

        # パブリックアーカイブに絞り込みます.
        #
        # @return [Model_IsoImage]
        def with_shared_scope
          _filter_by('Scope', Saclient::Cloud::Enums::EScope::shared)
          return self
        end

        # プライベートアーカイブに絞り込みます.
        #
        # @return [Model_IsoImage]
        def with_user_scope
          _filter_by('Scope', Saclient::Cloud::Enums::EScope::user)
          return self
        end

      end

    end
  end
end
