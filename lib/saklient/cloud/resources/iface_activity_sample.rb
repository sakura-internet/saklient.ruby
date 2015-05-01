# -*- encoding: UTF-8 -*-

require_relative '../../util'

module Saklient
  module Cloud
    module Resources

      # @private
      class IfaceActivitySample

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
        attr_accessor :_send

        public

        # @private
        # @return [Float]
        def get_send
          return @_send
        end

        # 送信[byte/sec]
        #
        # @return [Float]
        attr_reader :send

        def send
          get_send
        end

        protected

        # @private
        # @return [Float]
        attr_accessor :_receive

        public

        # @private
        # @return [Float]
        def get_receive
          return @_receive
        end

        # 受信[byte/sec]
        #
        # @return [Float]
        attr_reader :receive

        def receive
          get_receive
        end

        # @param [String] atStr
        # @param [any] data
        def initialize(atStr, data)
          Saklient::Util::validate_type(atStr, 'String')
          @_at = Saklient::Util::str2date(atStr)
          @_is_available = true
          v = nil
          v = data[:Send]
          if (v).nil?
            @_is_available = false
          else
            @_send = v
          end
          v = data[:Receive]
          if (v).nil?
            @_is_available = false
          else
            @_receive = v
          end
        end

      end

    end
  end
end
