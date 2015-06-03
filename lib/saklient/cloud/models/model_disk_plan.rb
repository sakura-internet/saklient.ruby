# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../client'
require_relative 'model'
require_relative '../resources/resource'
require_relative '../resources/disk_plan'

module Saklient
  module Cloud
    module Models

      # ディスクプランを検索するための機能を備えたクラス.
      class Model_DiskPlan < Saklient::Cloud::Models::Model

        protected

        # @private
        # @return [String]
        def _api_path
          return '/product/disk'
        end

        # @private
        # @return [String]
        def _root_key
          return 'DiskPlan'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'DiskPlans'
        end

        # @private
        # @return [String]
        def _class_name
          return 'DiskPlan'
        end

        # @private
        # @param [any] obj
        # @param [bool] wrapped
        # @return [Saklient::Cloud::Resources::Resource]
        def _create_resource_impl(obj, wrapped = false)
          Saklient::Util::validate_type(wrapped, 'bool')
          return Saklient::Cloud::Resources::DiskPlan.new(@_client, obj, wrapped)
        end

        public

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @param [Fixnum] offset オフセット
        # @return [Model_DiskPlan] this
        def offset(offset)
          Saklient::Util::validate_type(offset, 'Fixnum')
          return _offset(offset)
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @param [Fixnum] count 上限レコード数
        # @return [Model_DiskPlan] this
        def limit(count)
          Saklient::Util::validate_type(count, 'Fixnum')
          return _limit(count)
        end

        # Web APIのフィルタリング設定を直接指定します.
        #
        # @param [String] key キー
        # @param [any] value 値
        # @param [bool] multiple valueに配列を与え, OR条件で完全一致検索する場合にtrueを指定します. 通常, valueはスカラ値であいまい検索されます.
        # @return [Model_DiskPlan]
        def filter_by(key, value, multiple = false)
          Saklient::Util::validate_type(key, 'String')
          Saklient::Util::validate_type(multiple, 'bool')
          return _filter_by(key, value, multiple)
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @return [Model_DiskPlan] this
        def reset
          return _reset
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @param [String] id
        # @return [Saklient::Cloud::Resources::DiskPlan] リソースオブジェクト
        def get_by_id(id)
          Saklient::Util::validate_type(id, 'String')
          return _get_by_id(id)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @return [Array<Saklient::Cloud::Resources::DiskPlan>] リソースオブジェクトの配列
        def find
          return _find
        end

        # @private
        # @param [Saklient::Cloud::Client] client
        def initialize(client)
          super(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          @_hdd = nil
          @_ssd = nil
        end

        protected

        # @private
        # @return [Saklient::Cloud::Resources::DiskPlan]
        attr_accessor :_hdd

        # @private
        # @return [Saklient::Cloud::Resources::DiskPlan]
        def get_hdd
          @_hdd = get_by_id('2') if (@_hdd).nil?
          return @_hdd
        end

        public

        # 標準プラン
        #
        # @return [Saklient::Cloud::Resources::DiskPlan]
        attr_reader :hdd

        def hdd
          get_hdd
        end

        protected

        # @private
        # @return [Saklient::Cloud::Resources::DiskPlan]
        attr_accessor :_ssd

        # @private
        # @return [Saklient::Cloud::Resources::DiskPlan]
        def get_ssd
          @_ssd = get_by_id('4') if (@_ssd).nil?
          return @_ssd
        end

        public

        # SSDプラン
        #
        # @return [Saklient::Cloud::Resources::DiskPlan]
        attr_reader :ssd

        def ssd
          get_ssd
        end

      end

    end
  end
end
