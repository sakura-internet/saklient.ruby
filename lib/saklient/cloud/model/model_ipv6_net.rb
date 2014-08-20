# -*- encoding: UTF-8 -*-

require_relative 'model'
require_relative '../resource/ipv6_net'

module Saklient
  module Cloud
    module Model

      # IPv6ネットワークを検索するための機能を備えたクラス.
      class Model_Ipv6Net < Saklient::Cloud::Model::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/ipv6net'
        end

        # @private
        # @return [String]
        def _root_key
          return 'IPv6Net'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'IPv6Nets'
        end

        # @private
        # @return [String]
        def _class_name
          return 'IPv6Net'
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Fixnum] offset オフセット
        # @return [Model_Ipv6Net] this
        def offset(offset)
          Saklient::Util::validate_type(offset, 'Fixnum')
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Fixnum] count 上限レコード数
        # @return [Model_Ipv6Net] this
        def limit(count)
          Saklient::Util::validate_type(count, 'Fixnum')
          return _limit(count)
        end

        # Web APIのフィルタリング設定を直接指定します.
        #
        # @param [String] key キー
        # @param [any] value 値
        # @param [bool] multiple valueに配列を与え, OR条件で完全一致検索する場合にtrueを指定します. 通常, valueはスカラ値であいまい検索されます.
        # @return [Model_Ipv6Net]
        def filter_by(key, value, multiple = false)
          Saklient::Util::validate_type(key, 'String')
          Saklient::Util::validate_type(multiple, 'bool')
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_Ipv6Net] this
        def reset
          return _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saklient::Cloud::Resource::Ipv6Net] リソースオブジェクト
        def get_by_id(id)
          Saklient::Util::validate_type(id, 'String')
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saklient::Cloud::Resource::Ipv6Net>] リソースオブジェクトの配列
        def find
          return _find
        end

      end

    end
  end
end
