# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../util'

module Saklient
  module Cloud
    module Resources

      # @private
      class ServerActivitySample

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
        attr_accessor :_cpu_time

        public

        # @private
        # @return [Float]
        def get_cpu_time
          return @_cpu_time
        end

        # CPU時間
        #
        # @return [Float]
        attr_reader :cpu_time

        def cpu_time
          get_cpu_time
        end

        # @param [String] atStr
        # @param [any] data
        def initialize(atStr, data)
          Saklient::Util::validate_type(atStr, 'String')
          @_at = Saklient::Util::str2date(atStr)
          @_is_available = false
          v = data['CPU-TIME'.to_sym]
          if !(v).nil?
            @_is_available = true
            @_cpu_time = v
          end
        end

      end

    end
  end
end
