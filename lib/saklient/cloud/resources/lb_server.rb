# -*- encoding: UTF-8 -*-

require_relative '../../util'

module Saklient
  module Cloud
    module Resources

      # ロードバランサの監視対象サーバ.
      class LbServer

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

        # IPアドレス
        #
        # @return [String]
        attr_reader :ip_address

        def ip_address
          get_ip_address
        end

        protected

        # @private
        # @return [Fixnum]
        attr_accessor :_port

        public

        # @private
        # @return [Fixnum]
        def get_port
          return @_port
        end

        # ポート番号
        #
        # @return [Fixnum]
        attr_reader :port

        def port
          get_port
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_protocol

        public

        # @private
        # @return [String]
        def get_protocol
          return @_protocol
        end

        # 監視方法
        #
        # @return [String]
        attr_reader :protocol

        def protocol
          get_protocol
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_path_to_check

        public

        # @private
        # @return [String]
        def get_path_to_check
          return @_path_to_check
        end

        # パス
        #
        # @return [String]
        attr_reader :path_to_check

        def path_to_check
          get_path_to_check
        end

        protected

        # @private
        # @return [Fixnum]
        attr_accessor :_expected_status

        public

        # @private
        # @return [Fixnum]
        def get_expected_status
          return @_expected_status
        end

        # レスポンスコード
        #
        # @return [Fixnum]
        attr_reader :expected_status

        def expected_status
          get_expected_status
        end

        # @private
        # @param [any] obj
        def initialize(obj)
          health = Saklient::Util::get_by_path_any([obj], [
            'HealthCheck',
            'healthCheck',
            'health_check',
            'health'
          ])
          @_ip_address = Saklient::Util::get_by_path_any([obj], [
            'IPAddress',
            'ipAddress',
            'ip_address',
            'ip'
          ])
          @_protocol = Saklient::Util::get_by_path_any([health, obj], ['Protocol', 'protocol'])
          @_path_to_check = Saklient::Util::get_by_path_any([health, obj], ['Path', 'path'])
          port = Saklient::Util::get_by_path_any([obj], ['Port', 'port'])
          @_port = (port).nil? ? nil : (port).to_s().to_i(10)
          @_port = nil if @_port == 0
          status = Saklient::Util::get_by_path_any([health, obj], ['Status', 'status'])
          @_expected_status = (status).nil? ? nil : (status).to_s().to_i(10)
          @_expected_status = nil if @_expected_status == 0
        end

        # @return [any]
        def to_raw_settings
          return {
            IPAddress: @_ip_address,
            Port: @_port,
            HealthCheck: {
              Protocol: @_protocol,
              Path: @_path_to_check,
              Status: @_expected_status
            }
          }
        end

      end

    end
  end
end
