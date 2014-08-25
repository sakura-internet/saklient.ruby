# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative '../resource/resource'

module Saklient
  module Cloud
    module Model

      # @private
      class Model

        protected

        # @private
        # @return [Saklient::Cloud::Client]
        attr_accessor :_client

        # @private
        # @return [Saklient::Cloud::Client]
        def get_client
          return @_client
        end

        public

        # @return [Saklient::Cloud::Client]
        attr_reader :client

        def client
          get_client
        end

        protected

        # @private
        # @return [TQueryParams]
        attr_accessor :_params

        # @private
        # @return [TQueryParams]
        def get_params
          return @_params
        end

        public

        # @return [TQueryParams]
        attr_reader :params

        def params
          get_params
        end

        protected

        # @private
        # @return [Fixnum]
        attr_accessor :_total

        # @private
        # @return [Fixnum]
        def get_total
          return @_total
        end

        public

        # @return [Fixnum]
        attr_reader :total

        def total
          get_total
        end

        protected

        # @private
        # @return [Fixnum]
        attr_accessor :_count

        # @private
        # @return [Fixnum]
        def get_count
          return @_count
        end

        public

        # @return [Fixnum]
        attr_reader :count

        def count
          get_count
        end

        protected

        # @private
        # @return [String]
        def _api_path
          return nil
        end

        # @private
        # @return [String]
        def _root_key
          return nil
        end

        # @private
        # @return [String]
        def _root_key_m
          return nil
        end

        # @private
        # @return [String]
        def _class_name
          return nil
        end

        public

        # @param [Saklient::Cloud::Client] client
        def initialize(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          @_client = client
          _reset
        end

        protected

        # 次に取得するリストの開始オフセットを指定します.
        #
        # @private
        # @param [Fixnum] offset オフセット
        # @return [Model] this
        def _offset(offset)
          Saklient::Util::validate_type(offset, 'Fixnum')
          @_params[:Begin] = offset
          return self
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @private
        # @param [Fixnum] count 上限レコード数
        # @return [Model] this
        def _limit(count)
          Saklient::Util::validate_type(count, 'Fixnum')
          @_params[:Count] = count
          return self
        end

        # 次に取得するリストのソートカラムを指定します.
        #
        # @private
        # @param [String] column カラム名
        # @param [bool] reverse
        # @return [Model] this
        def _sort(column, reverse = false)
          Saklient::Util::validate_type(column, 'String')
          Saklient::Util::validate_type(reverse, 'bool')
          @_params[:Sort] = [] if !(!@_params.nil? && @_params.key?(:Sort))
          sort = @_params[:Sort]
          op = reverse ? '-' : ''
          sort << op + column
          return self
        end

        # Web APIのフィルタリング設定を直接指定します.
        #
        # @private
        # @param [String] key キー
        # @param [any] value 値
        # @param [bool] multiple valueに配列を与え, OR条件で完全一致検索する場合にtrueを指定します. 通常, valueはスカラ値であいまい検索されます.
        # @return [Model]
        def _filter_by(key, value, multiple = false)
          Saklient::Util::validate_type(key, 'String')
          Saklient::Util::validate_type(multiple, 'bool')
          @_params[:Filter] = {} if !(!@_params.nil? && @_params.key?(:Filter))
          filter = @_params[:Filter]
          if multiple
            filter[key.to_sym] = [] if !(!filter.nil? && filter.key?(key.to_sym))
            values = filter[key.to_sym]
            values << value
          else
            filter[key.to_sym] = value
          end
          return self
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @private
        # @return [Model] this
        def _reset
          @_params = { Count: 0 }
          @_total = 0
          @_count = 0
          return self
        end

        # 新規リソース作成用のオブジェクトを用意します.
        #
        # 返り値のオブジェクトにパラメータを設定し, save() を呼ぶことで実際のリソースが作成されます.
        #
        # @private
        # @return [Saklient::Cloud::Resource::Resource] リソースオブジェクト
        def _create
          return Saklient::Util::create_class_instance('saklient.cloud.resource.' + _class_name, [@_client, nil])
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @private
        # @param [String] id
        # @return [Saklient::Cloud::Resource::Resource] リソースオブジェクト
        def _get_by_id(id)
          Saklient::Util::validate_type(id, 'String')
          params = @_params
          _reset
          result = @_client.request('GET', _api_path + '/' + Saklient::Util::url_encode(id), params)
          @_total = 1
          @_count = 1
          return Saklient::Util::create_class_instance('saklient.cloud.resource.' + _class_name, [
            @_client,
            result,
            true
          ])
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @private
        # @return [Array<Saklient::Cloud::Resource::Resource>] リソースオブジェクトの配列
        def _find
          params = @_params
          _reset
          result = @_client.request('GET', _api_path, params)
          @_total = result[:Total]
          @_count = result[:Count]
          records = result[_root_key_m.to_sym]
          data = []
          for record in records
            i = Saklient::Util::create_class_instance('saklient.cloud.resource.' + _class_name, [@_client, record])
            data << i
          end
          return data
        end

        # リソースの検索リクエストを実行し, 唯一のリソースを取得します.
        #
        # @private
        # @return [Saklient::Cloud::Resource::Resource] リソースオブジェクト
        def _find_one
          params = @_params
          _reset
          result = @_client.request('GET', _api_path, params)
          @_total = result[:Total]
          @_count = result[:Count]
          return nil if @_total == 0
          records = result[_root_key_m.to_sym]
          return Saklient::Util::create_class_instance('saklient.cloud.resource.' + _class_name, [@_client, records[0]])
        end

        # 指定した文字列を名前に含むリソースに絞り込みます.
        #
        # 大文字・小文字は区別されません.
        # 半角スペースで区切られた複数の文字列は, それらをすべて含むことが条件とみなされます.
        #
        # @private
        # @param [String] name
        # @return [Model]
        def _with_name_like(name)
          Saklient::Util::validate_type(name, 'String')
          return _filter_by('Name', name)
        end

        # 指定したタグを持つリソースに絞り込みます.
        #
        # 複数のタグを指定する場合は withTags() を利用してください.
        #
        # @private
        # @param [String] tag
        # @return [Model]
        def _with_tag(tag)
          Saklient::Util::validate_type(tag, 'String')
          return _filter_by('Tags.Name', tag, true)
        end

        # 指定したすべてのタグを持つリソースに絞り込みます.
        #
        # @private
        # @param [Array<String>] tags
        # @return [Model]
        def _with_tags(tags)
          Saklient::Util::validate_type(tags, 'Array')
          return _filter_by('Tags.Name', tags, true)
        end

        # 名前でソートします.
        #
        # @private
        # @param [bool] reverse
        # @return [Model]
        def _sort_by_name(reverse = false)
          Saklient::Util::validate_type(reverse, 'bool')
          return _sort('Name', reverse)
        end

      end

    end
  end
end
