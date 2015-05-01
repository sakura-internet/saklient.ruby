# -*- encoding: UTF-8 -*-

require_relative '../../util'

module Saklient
  module Cloud
    module Resources

      # @private
      class RouterActivitySample

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
        attr_accessor :_outgoing

        public

        # @private
        # @return [Float]
        def get_outgoing
          return @_outgoing
        end

        # 送信[BPS]
        #
        # @return [Float]
        attr_reader :outgoing

        def outgoing
          get_outgoing
        end

        protected

        # @private
        # @return [Float]
        attr_accessor :_incoming

        public

        # @private
        # @return [Float]
        def get_incoming
          return @_incoming
        end

        # 受信[BPS]
        #
        # @return [Float]
        attr_reader :incoming

        def incoming
          get_incoming
        end

        # @param [String] atStr
        # @param [any] data
        def initialize(atStr, data)
          Saklient::Util::validate_type(atStr, 'String')
          @_at = Saklient::Util::str2date(atStr)
          @_is_available = true
          v = nil
          v = data[:Out]
          if (v).nil?
            @_is_available = false
          else
            @_outgoing = v
          end
          v = data[:In]
          if (v).nil?
            @_is_available = false
          else
            @_incoming = v
          end
        end

      end

    end
  end
end
