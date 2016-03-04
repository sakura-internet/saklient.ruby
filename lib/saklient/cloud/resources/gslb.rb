# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'common_service_item'
require_relative 'gslb_server'

module Saklient
  module Cloud
    module Resources

      # GSLBの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Gslb < Saklient::Cloud::Resources::CommonServiceItem

        protected

        # @private
        # @return [Array<GslbServer>]
        attr_accessor :_servers

        public

        # @private
        # @return [Array<GslbServer>]
        def get_servers
          return @_servers
        end

        # 仮想IPアドレス {GslbServer} の配列
        #
        # @return [Array<GslbServer>]
        attr_reader :servers

        def servers
          get_servers
        end

        # @private
        # @return [String]
        def get_protocol
          raw = Saklient::Util::get_by_path(self.raw_settings, 'GSLB.HealthCheck.Protocol')
          raise Saklient::Errors::SaklientException.new('invalid_data', 'Data of the resource is invalid') if (raw).nil?
          return raw
        end

        # @private
        # @param [String] v
        # @return [String]
        def set_protocol(v)
          Saklient::Util::validate_type(v, 'String')
          _normalize
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB.HealthCheck.Protocol', v)
          return v
        end

        # 監視方法
        #
        # @return [String]
        attr_accessor :protocol

        def protocol
          get_protocol
        end

        def protocol=(v)
          set_protocol(v)
        end

        # @private
        # @return [String]
        def get_path_to_check
          return nil if !Saklient::Util::exists_path(self.raw_settings, 'GSLB.HealthCheck.Path')
          raw = Saklient::Util::get_by_path(self.raw_settings, 'GSLB.HealthCheck.Path')
          return raw
        end

        # @private
        # @param [String] v
        # @return [String]
        def set_path_to_check(v)
          Saklient::Util::validate_type(v, 'String')
          _normalize
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB.HealthCheck.Path', v)
          return v
        end

        # 監視対象パス
        #
        # @return [String]
        attr_accessor :path_to_check

        def path_to_check
          get_path_to_check
        end

        def path_to_check=(v)
          set_path_to_check(v)
        end

        # @private
        # @return [Fixnum]
        def get_response_expected
          raw = Saklient::Util::get_by_path(self.raw_settings, 'GSLB.HealthCheck.Status')
          raise Saklient::Errors::SaklientException.new('invalid_data', 'Data of the resource is invalid') if (raw).nil?
          return (raw).to_s().to_i(10)
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_response_expected(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          _normalize
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB.HealthCheck.Status', v)
          return v
        end

        # 監視時に期待されるレスポンスコード
        #
        # @return [Fixnum]
        attr_accessor :response_expected

        def response_expected
          get_response_expected
        end

        def response_expected=(v)
          set_response_expected(v)
        end

        # @private
        # @return [Fixnum]
        def get_delay_loop
          delayLoop = Saklient::Util::get_by_path(self.raw_settings, 'GSLB.DelayLoop')
          raise Saklient::Errors::SaklientException.new('invalid_data', 'Data of the resource is invalid') if (delayLoop).nil?
          return (delayLoop).to_s().to_i(10)
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_delay_loop(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          _normalize
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB.DelayLoop', v)
          return v
        end

        # チェック間隔(秒)
        #
        # @return [Fixnum]
        attr_accessor :delay_loop

        def delay_loop
          get_delay_loop
        end

        def delay_loop=(v)
          set_delay_loop(v)
        end

        # @private
        # @return [bool]
        def get_weighted
          weighted = Saklient::Util::get_by_path(self.raw_settings, 'GSLB.Weighted')
          raise Saklient::Errors::SaklientException.new('invalid_data', 'Data of the resource is invalid') if (weighted).nil?
          return weighted.downcase() == 'true'
        end

        # @private
        # @param [bool] v
        # @return [bool]
        def set_weighted(v)
          Saklient::Util::validate_type(v, 'bool')
          _normalize
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB.Weighted', v ? 'True' : 'False')
          return v
        end

        # 重み付け応答
        #
        # @return [bool]
        attr_accessor :weighted

        def weighted
          get_weighted
        end

        def weighted=(v)
          set_weighted(v)
        end

        # @private
        # @param [Saklient::Cloud::Client] client
        # @param [any] obj
        # @param [bool] wrapped
        def initialize(client, obj, wrapped = false)
          super(client, obj, wrapped)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(wrapped, 'bool')
          _normalize
        end

        protected

        # @private
        # @ignore
        # @return [void]
        def _normalize
          @_servers = [] if (@_servers).nil?
          self.raw_settings = {} if (self.raw_settings).nil?
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB', {}) if !Saklient::Util::exists_path(self.raw_settings, 'GSLB')
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB.HealthCheck', {}) if !Saklient::Util::exists_path(self.raw_settings, 'GSLB.HealthCheck')
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB.Servers', []) if !Saklient::Util::exists_path(self.raw_settings, 'GSLB.Servers')
        end

        # @private
        # @param [any] r
        # @param [any] root
        # @return [void]
        def _on_after_api_deserialize(r, root)
          _normalize
          @_servers = []
          settings = self.raw_settings
          if !(settings).nil?
            raw = Saklient::Util::get_by_path(settings, 'GSLB.Servers')
            if !(raw).nil?
              servers = raw
              for server in servers
                @_servers << Saklient::Cloud::Resources::GslbServer.new(server)
              end
            end
          end
        end

        # @private
        # @param [bool] withClean
        # @return [void]
        def _on_before_api_serialize(withClean)
          Saklient::Util::validate_type(withClean, 'bool')
          _normalize
          servers = []
          for server in @_servers
            servers << server.to_raw_settings
          end
          Saklient::Util::set_by_path(self.raw_settings, 'GSLB.Servers', servers)
        end

        # @private
        # @param [any] r
        # @param [bool] withClean
        # @return [void]
        def _on_after_api_serialize(r, withClean)
          Saklient::Util::validate_type(withClean, 'bool')
          return nil if (r).nil?
          Saklient::Util::set_by_path(r, 'Provider', {})
          Saklient::Util::set_by_path(r, 'Provider.Class', 'gslb')
        end

        public

        # @private
        # @param [String] protocol
        # @param [Fixnum] delayLoop
        # @param [bool] weighted
        # @return [Gslb]
        def set_initial_params(protocol, delayLoop = 10, weighted = true)
          Saklient::Util::validate_type(protocol, 'String')
          Saklient::Util::validate_type(delayLoop, 'Fixnum')
          Saklient::Util::validate_type(weighted, 'bool')
          settings = self.raw_settings
          self.protocol = protocol
          self.delay_loop = delayLoop
          self.weighted = weighted
          return self
        end

        # 監視対象サーバ設定を追加します.
        #
        # @param [any] settings 設定オブジェクト
        # @return [GslbServer]
        def add_server(settings = nil)
          ret = Saklient::Cloud::Resources::GslbServer.new(settings)
          @_servers << ret
          return ret
        end

      end

    end
  end
end
