# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../util'

module Saklient
  module Cloud
    module Resources

      # GSLBの監視対象サーバ設定.
      class GslbServer

        protected

        # @private
        # @return [bool]
        attr_accessor :_enabled

        public

        # @private
        # @return [bool]
        def get_enabled
          return @_enabled
        end

        # @private
        # @param [bool] v
        # @return [bool]
        def set_enabled(v)
          Saklient::Util::validate_type(v, 'bool')
          @_enabled = v
          return @_enabled
        end

        # 有効状態
        #
        # @return [bool]
        attr_accessor :enabled

        def enabled
          get_enabled
        end

        def enabled=(v)
          set_enabled(v)
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_ip_address

        public

        # @private
        # @return [String]
        def get_ip_address
          return @_ip_address
        end

        # @private
        # @param [String] v
        # @return [String]
        def set_ip_address(v)
          Saklient::Util::validate_type(v, 'String')
          @_ip_address = v
          return @_ip_address
        end

        # IPアドレス
        #
        # @return [String]
        attr_accessor :ip_address

        def ip_address
          get_ip_address
        end

        def ip_address=(v)
          set_ip_address(v)
        end

        protected

        # @private
        # @return [Fixnum]
        attr_accessor :_weight

        public

        # @private
        # @return [Fixnum]
        def get_weight
          return @_weight
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_weight(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          @_weight = v
          return @_weight
        end

        # 重み値
        #
        # @return [Fixnum]
        attr_accessor :weight

        def weight
          get_weight
        end

        def weight=(v)
          set_weight(v)
        end

        # @private
        # @param [any] obj
        def initialize(obj = nil)
          obj = {} if (obj).nil?
          enabled = Saklient::Util::get_by_path_any([obj], ['Enabled', 'enabled'])
          @_enabled = nil
          if !(enabled).nil?
            enabledStr = enabled
            @_enabled = enabledStr.downcase() == 'true'
          end
          @_ip_address = Saklient::Util::get_by_path_any([obj], [
            'IPAddress',
            'ipAddress',
            'ip_address',
            'ip'
          ])
          weight = Saklient::Util::get_by_path_any([obj], ['Weight', 'weight'])
          @_weight = nil
          @_weight = (weight).to_s().to_i(10) if !(weight).nil?
          @_weight = nil if @_weight == 0
        end

        # @return [any]
        def to_raw_settings
          return {
            Enabled: (@_enabled).nil? ? nil : (@_enabled ? 'True' : 'False'),
            IPAddress: @_ip_address,
            Weight: @_weight
          }
        end

      end

    end
  end
end
