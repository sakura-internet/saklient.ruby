# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../client'
require_relative 'model'
require_relative '../resources/resource'
require_relative '../resources/iso_image'
require_relative '../enums/escope'

module Saklient
  module Cloud
    module Models

      # ISOイメージを検索・作成するための機能を備えたクラス.
      class Model_IsoImage < Saklient::Cloud::Models::Model

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

        # @private
        # @param [any] obj
        # @param [bool] wrapped
        # @return [Saklient::Cloud::Resources::Resource]
        def _create_resource_impl(obj, wrapped = false)
          Saklient::Util::validate_type(wrapped, 'bool')
          return Saklient::Cloud::Resources::IsoImage.new(@_client, obj, wrapped)
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Fixnum] offset オフセット
        # @return [Model_IsoImage] this
        def offset(offset)
          Saklient::Util::validate_type(offset, 'Fixnum')
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Fixnum] count 上限レコード数
        # @return [Model_IsoImage] this
        def limit(count)
          Saklient::Util::validate_type(count, 'Fixnum')
          return _limit(count)
        end

        # Web APIのフィルタリング設定を直接指定します.
        #
        # @param [String] key キー
        # @param [any] value 値
        # @param [bool] multiple valueに配列を与え, OR条件で完全一致検索する場合にtrueを指定します. 通常, valueはスカラ値であいまい検索されます.
        # @return [Model_IsoImage]
        def filter_by(key, value, multiple = false)
          Saklient::Util::validate_type(key, 'String')
          Saklient::Util::validate_type(multiple, 'bool')
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_IsoImage] this
        def reset
          return _reset
        end

        # 新規リソース作成用のオブジェクトを用意します.
        #
        # 返り値のオブジェクトにパラメータを設定し, save() を呼ぶことで実際のリソースが作成されます.
        #
        # @return [Saklient::Cloud::Resources::IsoImage] リソースオブジェクト
        def create
          return _create
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saklient::Cloud::Resources::IsoImage] リソースオブジェクト
        def get_by_id(id)
          Saklient::Util::validate_type(id, 'String')
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saklient::Cloud::Resources::IsoImage>] リソースオブジェクトの配列
        def find
          return _find
        end

        # 指定した文字列を名前に含むリソースに絞り込みます.
        #
        # 大文字・小文字は区別されません.
        # 半角スペースで区切られた複数の文字列は, それらをすべて含むことが条件とみなされます.
        #
        # @todo Implement test case
        # @param [String] name
        # @return [Model_IsoImage]
        def with_name_like(name)
          Saklient::Util::validate_type(name, 'String')
          return _with_name_like(name)
        end

        # 指定したタグを持つリソースに絞り込みます.
        #
        # 複数のタグを指定する場合は withTags() を利用してください.
        #
        # @todo Implement test case
        # @param [String] tag
        # @return [Model_IsoImage]
        def with_tag(tag)
          Saklient::Util::validate_type(tag, 'String')
          return _with_tag(tag)
        end

        # 指定したすべてのタグを持つリソースに絞り込みます.
        #
        # @todo Implement test case
        # @param [Array<String>] tags
        # @return [Model_IsoImage]
        def with_tags(tags)
          Saklient::Util::validate_type(tags, 'Array')
          return _with_tags(tags)
        end

        # 指定したDNFに合致するタグを持つリソースに絞り込みます.
        #
        # @todo Implement test case
        # @param [Array<Array<String>>] dnf
        # @return [Model_IsoImage]
        def with_tag_dnf(dnf)
          Saklient::Util::validate_type(dnf, 'Array')
          return _with_tag_dnf(dnf)
        end

        # 名前でソートします.
        #
        # @todo Implement test case
        # @param [bool] reverse
        # @return [Model_IsoImage]
        def sort_by_name(reverse = false)
          Saklient::Util::validate_type(reverse, 'bool')
          return _sort_by_name(reverse)
        end

        # @private
        # @param [Saklient::Cloud::Client] client
        def initialize(client)
          super(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
        end

        # 指定したサイズのISOイメージに絞り込みます.
        #
        # @param [Fixnum] sizeGib
        # @return [Model_IsoImage]
        def with_size_gib(sizeGib)
          Saklient::Util::validate_type(sizeGib, 'Fixnum')
          _filter_by('SizeMB', [sizeGib * 1024])
          return self
        end

        # パブリックISOイメージに絞り込みます.
        #
        # @return [Model_IsoImage]
        def with_shared_scope
          _filter_by('Scope', [Saklient::Cloud::Enums::EScope::shared])
          return self
        end

        # プライベートISOイメージに絞り込みます.
        #
        # @return [Model_IsoImage]
        def with_user_scope
          _filter_by('Scope', [Saklient::Cloud::Enums::EScope::user])
          return self
        end

        # サイズでソートします.
        #
        # @param [bool] reverse
        # @return [Model_IsoImage]
        def sort_by_size(reverse = false)
          Saklient::Util::validate_type(reverse, 'bool')
          _sort('SizeMB', reverse)
          return self
        end

      end

    end
  end
end
