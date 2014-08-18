# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/swytch'

module Saclient
  module Cloud
    module Model

      # スイッチを検索するための機能を備えたクラス.
      class Model_Swytch < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/switch'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Switch'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Switches'
        end

        # @private
        # @return [String]
        def _class_name
          return 'Swytch'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Fixnum] offset オフセット
        # @return [Model_Swytch] this
        def offset(offset)
          Saclient::Util::validate_type(offset, 'Fixnum')
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Fixnum] count 上限レコード数
        # @return [Model_Swytch] this
        def limit(count)
          Saclient::Util::validate_type(count, 'Fixnum')
          return _limit(count)
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model_Swytch]
        def filter_by(key, value, multiple = false)
          Saclient::Util::validate_type(key, 'String')
          Saclient::Util::validate_type(multiple, 'bool')
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Swytch] this
        def reset
          return _reset
        end

        # *
        #
        # @return [Saclient::Cloud::Resource::Swytch]
        def create
          return _create
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Swytch] リソースオブジェクト
        def get_by_id(id)
          Saclient::Util::validate_type(id, 'String')
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::Swytch>] リソースオブジェクトの配列
        def find
          return _find
        end

        # 指定した文字列を名前に含むスイッチに絞り込みます.
        #
        # @param [String] name
        # @return [Model_Swytch]
        def with_name_like(name)
          Saclient::Util::validate_type(name, 'String')
          _filter_by('Name', name)
          return self
        end

        # 名前でソートします.
        #
        # @param [bool] reverse
        # @return [Model_Swytch]
        def sort_by_name(reverse = false)
          Saclient::Util::validate_type(reverse, 'bool')
          _sort('Name', reverse)
          return self
        end

      end

    end
  end
end
