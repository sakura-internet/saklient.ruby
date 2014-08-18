# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/archive'
require_relative '../enums/escope'

module Saclient
  module Cloud
    module Model

      # アーカイブを検索するための機能を備えたクラス.
      class Model_Archive < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/archive'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Archive'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Archives'
        end

        # @private
        # @return [String]
        def _class_name
          return 'Archive'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Fixnum] offset オフセット
        # @return [Model_Archive] this
        def offset(offset)
          Saclient::Util::validate_type(offset, 'Fixnum')
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Fixnum] count 上限レコード数
        # @return [Model_Archive] this
        def limit(count)
          Saclient::Util::validate_type(count, 'Fixnum')
          return _limit(count)
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model_Archive]
        def filter_by(key, value, multiple = false)
          Saclient::Util::validate_type(key, 'String')
          Saclient::Util::validate_type(multiple, 'bool')
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Archive] this
        def reset
          return _reset
        end

        # *
        #
        # @return [Saclient::Cloud::Resource::Archive]
        def create
          return _create
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Archive] リソースオブジェクト
        def get_by_id(id)
          Saclient::Util::validate_type(id, 'String')
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::Archive>] リソースオブジェクトの配列
        def find
          return _find
        end

        # 指定した文字列を名前に含むアーカイブに絞り込みます.
        #
        # @param [String] name
        # @return [Model_Archive]
        def with_name_like(name)
          Saclient::Util::validate_type(name, 'String')
          _filter_by('Name', name)
          return self
        end

        # 指定したタグを持つアーカイブに絞り込みます.
        #
        # @param [String] tag
        # @return [Model_Archive]
        def with_tag(tag)
          Saclient::Util::validate_type(tag, 'String')
          _filter_by('Tags.Name', tag, true)
          return self
        end

        # 指定したタグを持つアーカイブに絞り込みます.
        #
        # @param [Array<String>] tags
        # @return [Model_Archive]
        def with_tags(tags)
          Saclient::Util::validate_type(tags, 'Array')
          _filter_by('Tags.Name', tags, true)
          return self
        end

        # 指定したサイズのアーカイブに絞り込みます.
        #
        # @param [Fixnum] sizeGib
        # @return [Model_Archive]
        def with_size_gib(sizeGib)
          Saclient::Util::validate_type(sizeGib, 'Fixnum')
          _filter_by('SizeMB', sizeGib * 1024)
          return self
        end

        # パブリックアーカイブに絞り込みます.
        #
        # @return [Model_Archive]
        def with_shared_scope
          _filter_by('Scope', Saclient::Cloud::Enums::EScope::shared)
          return self
        end

        # プライベートアーカイブに絞り込みます.
        #
        # @return [Model_Archive]
        def with_user_scope
          _filter_by('Scope', Saclient::Cloud::Enums::EScope::user)
          return self
        end

        # 名前でソートします.
        #
        # @param [bool] reverse
        # @return [Model_Archive]
        def sort_by_name(reverse = false)
          Saclient::Util::validate_type(reverse, 'bool')
          _sort('Name', reverse)
          return self
        end

        # サイズでソートします.
        #
        # @param [bool] reverse
        # @return [Model_Archive]
        def sort_by_size(reverse = false)
          Saclient::Util::validate_type(reverse, 'bool')
          _sort('SizeMB', reverse)
          return self
        end

      end

    end
  end
end
