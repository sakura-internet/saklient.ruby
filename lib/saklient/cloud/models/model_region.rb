# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../client'
require_relative 'model'
require_relative '../resources/resource'
require_relative '../resources/region'

module Saklient
  module Cloud
    module Models

      # リージョンを検索するための機能を備えたクラス.
      class Model_Region < Saklient::Cloud::Models::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/region'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Region'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Regions'
        end

        # @private
        # @return [String]
        def _class_name
          return 'Region'
        end

        # @private
        # @param [any] obj
        # @param [bool] wrapped
        # @return [Saklient::Cloud::Resources::Resource]
        def _create_resource_impl(obj, wrapped = false)
          Saklient::Util::validate_type(wrapped, 'bool')
          return Saklient::Cloud::Resources::Region.new(@_client, obj, wrapped)
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Fixnum] offset オフセット
        # @return [Model_Region] this
        def offset(offset)
          Saklient::Util::validate_type(offset, 'Fixnum')
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Fixnum] count 上限レコード数
        # @return [Model_Region] this
        def limit(count)
          Saklient::Util::validate_type(count, 'Fixnum')
          return _limit(count)
        end

        # Web APIのフィルタリング設定を直接指定します.
        #
        # @param [String] key キー
        # @param [any] value 値
        # @param [bool] multiple valueに配列を与え, OR条件で完全一致検索する場合にtrueを指定します. 通常, valueはスカラ値であいまい検索されます.
        # @return [Model_Region]
        def filter_by(key, value, multiple = false)
          Saklient::Util::validate_type(key, 'String')
          Saklient::Util::validate_type(multiple, 'bool')
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Region] this
        def reset
          return _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saklient::Cloud::Resources::Region] リソースオブジェクト
        def get_by_id(id)
          Saklient::Util::validate_type(id, 'String')
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saklient::Cloud::Resources::Region>] リソースオブジェクトの配列
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
        # @return [Model_Region]
        def with_name_like(name)
          Saklient::Util::validate_type(name, 'String')
          return _with_name_like(name)
        end

        # 名前でソートします.
        #
        # @todo Implement test case
        # @param [bool] reverse
        # @return [Model_Region]
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

      end

    end
  end
end
