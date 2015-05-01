# -*- encoding: UTF-8 -*-

require_relative '../../util'

module Saklient
  module Cloud
    module Resources

      # ロードバランサの監視対象サーバ設定.
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
        attr_accessor :_port

        public

        # @private
        # @return [Fixnum]
        def get_port
          return @_port
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_port(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          @_port = v
          return @_port
        end

        # ポート番号
        #
        # @return [Fixnum]
        attr_accessor :port

        def port
          get_port
        end

        def port=(v)
          set_port(v)
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

        # @private
        # @param [String] v
        # @return [String]
        def set_protocol(v)
          Saklient::Util::validate_type(v, 'String')
          @_protocol = v
          return @_protocol
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

        # @private
        # @param [String] v
        # @return [String]
        def set_path_to_check(v)
          Saklient::Util::validate_type(v, 'String')
          @_path_to_check = v
          return @_path_to_check
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

        protected

        # @private
        # @return [Fixnum]
        attr_accessor :_response_expected

        public

        # @private
        # @return [Fixnum]
        def get_response_expected
          return @_response_expected
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_response_expected(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          @_response_expected = v
          return @_response_expected
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

        protected

        # @private
        # @return [Fixnum]
        attr_accessor :_active_connections

        public

        # @private
        # @return [Fixnum]
        def get_active_connections
          return @_active_connections
        end

        # 現在の接続数
        #
        # @return [Fixnum]
        attr_reader :active_connections

        def active_connections
          get_active_connections
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_status

        public

        # @private
        # @return [String]
        def get_status
          return @_status
        end

        # 現在の状態
        #
        # @return [String]
        attr_reader :status

        def status
          get_status
        end

        # @private
        # @param [any] obj
        def initialize(obj = nil)
          obj = {} if (obj).nil?
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
          @_path_to_check = Saklient::Util::get_by_path_any([health, obj], [
            'Path',
            'path',
            'pathToCheck',
            'path_to_check'
          ])
          port = Saklient::Util::get_by_path_any([obj], ['Port', 'port'])
          @_port = nil
          @_port = (port).to_s().to_i(10) if !(port).nil?
          @_port = nil if @_port == 0
          responseExpected = Saklient::Util::get_by_path_any([health, obj], [
            'Status',
            'status',
            'responseExpected',
            'response_expected'
          ])
          @_response_expected = nil
          @_response_expected = (responseExpected).to_s().to_i(10) if !(responseExpected).nil?
          @_response_expected = nil if @_response_expected == 0
          @_active_connections = 0
          @_status = nil
        end

        # @return [any]
        def to_raw_settings
          return {
            IPAddress: @_ip_address,
            Port: @_port,
            HealthCheck: {
              Protocol: @_protocol,
              Path: @_path_to_check,
              Status: @_response_expected
            }
          }
        end

        # @private
        # @param [any] obj
        # @return [LbServer]
        def update_status(obj)
          connStr = obj[:ActiveConn]
          @_active_connections = 0
          @_active_connections = (connStr).to_s().to_i(10) if !(connStr).nil?
          status = obj[:Status]
          @_status = (status).nil? ? nil : status.downcase()
          return self
        end

      end

    end
  end
end
