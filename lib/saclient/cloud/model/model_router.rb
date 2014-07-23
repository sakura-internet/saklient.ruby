# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/router'

module Saclient
  module Cloud
    module Model

      # ルータを検索するための機能を備えたクラス.
      class Model_Router < Saclient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/internet'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Internet'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Internet'
        end

        # @private
        # @return [String]
        def _class_name
          return 'Router'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Integer] offset オフセット
        # @return [Model_Router] this
        def offset(offset)
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Integer] count 上限レコード数
        # @return [Model_Router] this
        def limit(count)
          return _limit(count)
        end

        # APIのフィルタリング設定を直接指定します.
        #
        # @param [any] value
        # @param [bool] multiple
        # @param [String] key
        # @return [Model_Router]
        def filter_by(key, value, multiple = false)
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Router] this
        def reset
          return _reset
        end

        # *
        #
        # @return [Saclient::Cloud::Resource::Router]
        def create
          return _create
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saclient::Cloud::Resource::Router] リソースオブジェクト
        def get_by_id(id)
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saclient::Cloud::Resource::Router>] リソースオブジェクトの配列
        def find
          return _find
        end

        # 指定した文字列を名前に含むルータに絞り込みます.
        #
        # @param [String] name
        # @return [Model_Router]
        def with_name_like(name)
          _filter_by('Name', name)
          return self
        end

        # 指定した帯域幅のルータに絞り込みます.
        #
        # @param [Integer] mbps
        # @return [Model_Router]
        def with_band_width_mbps(mbps)
          _filter_by('BandWidthMbps', mbps)
          return self
        end

      end

    end
  end
end
