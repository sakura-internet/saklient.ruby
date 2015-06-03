# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../util'

module Saklient
  module Cloud
    module Resources

      # @private
      class DiskActivitySample

        protected

        # @private
        # @return [NativeDate]
        attr_accessor :_at

        public

        # @private
        # @return [NativeDate]
        def get_at
          return @_at
        end

        # 記録日時
        #
        # @return [NativeDate]
        attr_reader :at

        def at
          get_at
        end

        protected

        # @private
        # @return [bool]
        attr_accessor :_is_available

        public

        # @private
        # @return [bool]
        def get_is_available
          return @_is_available
        end

        # 有効な値のとき真
        #
        # @return [bool]
        attr_reader :is_available

        def is_available
          get_is_available
        end

        protected

        # @private
        # @return [Float]
        attr_accessor :_write

        public

        # @private
        # @return [Float]
        def get_write
          return @_write
        end

        # ライト[BPS]
        #
        # @return [Float]
        attr_reader :write

        def write
          get_write
        end

        protected

        # @private
        # @return [Float]
        attr_accessor :_read

        public

        # @private
        # @return [Float]
        def get_read
          return @_read
        end

        # リード[BPS]
        #
        # @return [Float]
        attr_reader :read

        def read
          get_read
        end

        # @param [String] atStr
        # @param [any] data
        def initialize(atStr, data)
          Saklient::Util::validate_type(atStr, 'String')
          @_at = Saklient::Util::str2date(atStr)
          @_is_available = true
          v = nil
          v = data[:Write]
          if (v).nil?
            @_is_available = false
          else
            @_write = v
          end
          v = data[:Read]
          if (v).nil?
            @_is_available = false
          else
            @_read = v
          end
        end

      end

    end
  end
end
