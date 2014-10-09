# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative '../resources/resource'
require_relative 'query_params'
require_relative '../../errors/saklient_exception'

module Saklient
  module Cloud
    module Models

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
        # @return [QueryParams]
        attr_accessor :_query

        # @private
        # @return [QueryParams]
        def get_query
          return @_query
        end

        public

        # @return [QueryParams]
        attr_reader :query

        def query
          get_query
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
          @_query.begin = offset
          return self
        end

        # 次に取得するリストの上限レコード数を指定します.
        #
        # @private
        # @param [Fixnum] count 上限レコード数
        # @return [Model] this
        def _limit(count)
          Saklient::Util::validate_type(count, 'Fixnum')
          @_query.count = count
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
          op = reverse ? '-' : ''
          @_query.sort << op + column
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
          filter = @_query.filter
          if multiple
            filter[key.to_sym] = [] if !(!filter.nil? && filter.key?(key.to_sym))
            values = filter[key.to_sym]
            values << value
          else
            raise Saklient::Errors::SaklientException.new('filter_duplicated', 'The same filter key can be specified only once (by calling the same method \'withFooBar\')') if !filter.nil? && filter.key?(key.to_sym)
            filter[key.to_sym] = value
          end
          return self
        end

        # 次のリクエストのために設定されているステートをすべて破棄します.
        #
        # @private
        # @return [Model] this
        def _reset
          @_query = Saklient::Cloud::Models::QueryParams.new()
          @_total = 0
          @_count = 0
          return self
        end

        # @private
        # @param [String] className
        # @param [any] obj
        # @param [bool] wrapped
        # @return [Saklient::Cloud::Resources::Resource]
        def _create_resource_with(className, obj, wrapped = false)
          Saklient::Util::validate_type(className, 'String')
          Saklient::Util::validate_type(wrapped, 'bool')
          className = _class_name if (className).nil?
          return Saklient::Cloud::Resources::Resource::create_with(className, @_client, obj, wrapped)
        end

        # 新規リソース作成用のオブジェクトを用意します.
        #
        # 返り値のオブジェクトにパラメータを設定し, save() を呼ぶことで実際のリソースが作成されます.
        #
        # @private
        # @param [String] className
        # @return [Saklient::Cloud::Resources::Resource] リソースオブジェクト
        def _create(className = nil)
          Saklient::Util::validate_type(className, 'String')
          return _create_resource_with(className, nil)
        end

        # 指定したIDを持つ唯一のリソースを取得します.
        #
        # @private
        # @param [String] id
        # @return [Saklient::Cloud::Resources::Resource] リソースオブジェクト
        def _get_by_id(id)
          Saklient::Util::validate_type(id, 'String')
          query = @_query.build
          _reset
          result = @_client.request('GET', _api_path + '/' + Saklient::Util::url_encode(id), query)
          @_total = 1
          @_count = 1
          return _create_resource_with(nil, result, true)
        end

        # リソースの検索リクエストを実行し, 結果をリストで取得します.
        #
        # @private
        # @return [Array<Saklient::Cloud::Resources::Resource>] リソースオブジェクトの配列
        def _find
          query = @_query.build
          _reset
          result = @_client.request('GET', _api_path, query)
          @_total = result[:Total]
          @_count = result[:Count]
          data = []
          records = result[_root_key_m.to_sym]
          for record in records
            data << _create_resource_with(nil, record)
          end
          return data
        end

        # リソースの検索リクエストを実行し, 唯一のリソースを取得します.
        #
        # @private
        # @return [Saklient::Cloud::Resources::Resource] リソースオブジェクト
        def _find_one
          query = @_query.build
          _reset
          result = @_client.request('GET', _api_path, query)
          @_total = result[:Total]
          @_count = result[:Count]
          return nil if @_total == 0
          records = result[_root_key_m.to_sym]
          return _create_resource_with(nil, records[0])
        end

        # 指定した文字列を名前に含むリソースに絞り込みます.
        #
        # 大文字・小文字は区別されません.
        # 半角スペースで区切られた複数の文字列は, それらをすべて含むことが条件とみなされます.
        #
        # @private
        # @todo Implement test case
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
        # @todo Implement test case
        # @param [String] tag
        # @return [Model]
        def _with_tag(tag)
          Saklient::Util::validate_type(tag, 'String')
          return _filter_by('Tags.Name', [tag])
        end

        # 指定したすべてのタグを持つリソースに絞り込みます.
        #
        # @private
        # @todo Implement test case
        # @param [Array<String>] tags
        # @return [Model]
        def _with_tags(tags)
          Saklient::Util::validate_type(tags, 'Array')
          return _filter_by('Tags.Name', [tags])
        end

        # 指定したDNFに合致するタグを持つリソースに絞り込みます.
        #
        # @private
        # @todo Implement test case
        # @param [Array<Array<String>>] dnf
        # @return [Model]
        def _with_tag_dnf(dnf)
          Saklient::Util::validate_type(dnf, 'Array')
          return _filter_by('Tags.Name', dnf)
        end

        # 名前でソートします.
        #
        # @private
        # @todo Implement test case
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
