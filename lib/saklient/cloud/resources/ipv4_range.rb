# -*- encoding: UTF-8 -*-

require_relative '../../util'

module Saklient
  module Cloud
    module Resources

      # IPv4ネットワークのIPアドレス範囲.
      class Ipv4Range

        protected

        # @private
        # @return [String]
        attr_accessor :_first

        public

        # @private
        # @return [String]
        def get_first
          return @_first
        end

        # 開始アドレス
        #
        # @return [String]
        attr_reader :first

        def first
          get_first
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_last

        public

        # @private
        # @return [String]
        def get_last
          return @_last
        end

        # 終了アドレス
        #
        # @return [String]
        attr_reader :last

        def last
          get_last
        end

        protected

        # @private
        # @return [Array<String>]
        attr_accessor :_as_array

        public

        # @private
        # @return [Array<String>]
        def get_as_array
          ret = []
          i = Saklient::Util::ip2long(@_first)
          i1 = Saklient::Util::ip2long(@_last)
          while i <= i1 do
            ret << Saklient::Util::long2ip(i)
            i += 1
          end
          return ret
        end

        # この範囲に属するIPv4アドレスの一覧を取得します.
        #
        # @return [Array<String>]
        attr_reader :as_array

        def as_array
          get_as_array
        end

        # @private
        # @param [any] obj
        def initialize(obj = nil)
          obj = {} if (obj).nil?
          first = Saklient::Util::get_by_path_any([obj], ['Min', 'min'])
          @_first = nil
          @_first = first if !(first).nil?
          @_first = nil if @_first == ''
          last = Saklient::Util::get_by_path_any([obj], ['Max', 'max'])
          @_last = nil
          @_last = last if !(last).nil?
          @_last = nil if @_last == ''
        end

      end

    end
  end
end
