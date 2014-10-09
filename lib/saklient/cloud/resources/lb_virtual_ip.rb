# -*- encoding: UTF-8 -*-

require_relative '../../util'
require_relative 'lb_server'

module Saklient
  module Cloud
    module Resources

      # ロードバランサの仮想IPアドレス.
      class LbVirtualIp

        protected

        # @private
        # @return [String]
        attr_accessor :_virtual_ip_address

        public

        # @private
        # @return [String]
        def get_virtual_ip_address
          return @_virtual_ip_address
        end

        # VIPアドレス
        #
        # @return [String]
        attr_reader :virtual_ip_address

        def virtual_ip_address
          get_virtual_ip_address
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
        # @return [Fixnum]
        attr_accessor :_delay_loop

        public

        # @private
        # @return [Fixnum]
        def get_delay_loop
          return @_delay_loop
        end

        # チェック間隔 [秒]
        #
        # @return [Fixnum]
        attr_reader :delay_loop

        def delay_loop
          get_delay_loop
        end

        protected

        # @private
        # @return [Array<LbServer>]
        attr_accessor :_servers

        public

        # @private
        # @return [Array<LbServer>]
        def get_servers
          return @_servers
        end

        # 実サーバ
        #
        # @return [Array<LbServer>]
        attr_reader :servers

        def servers
          get_servers
        end

        # @private
        # @param [any] obj
        def initialize(obj)
          vip = Saklient::Util::get_by_path_any([obj], [
            'VirtualIPAddress',
            'virtualIpAddress',
            'virtual_ip_address',
            'vip'
          ])
          @_virtual_ip_address = vip
          port = Saklient::Util::get_by_path_any([obj], ['Port', 'port'])
          @_port = (port).nil? ? nil : (port).to_s().to_i(10)
          @_port = nil if @_port == 0
          delayLoop = Saklient::Util::get_by_path_any([obj], [
            'DelayLoop',
            'delayLoop',
            'delay_loop',
            'delay'
          ])
          @_delay_loop = (delayLoop).nil? ? nil : (delayLoop).to_s().to_i(10)
          @_delay_loop = nil if @_delay_loop == 0
          @_servers = []
          serversDyn = Saklient::Util::get_by_path_any([obj], ['Servers', 'servers'])
          if !(serversDyn).nil?
            servers = serversDyn
            for server in servers
              @_servers << Saklient::Cloud::Resources::LbServer.new(server)
            end
          end
        end

        # @param [any] settings
        # @return [LbVirtualIp]
        def add_server(settings)
          @_servers << Saklient::Cloud::Resources::LbServer.new(settings)
          return self
        end

        # @return [any]
        def to_raw_settings
          servers = []
          for server in @_servers
            servers << server.to_raw_settings
          end
          return {
            VirtualIPAddress: @_virtual_ip_address,
            Port: @_port,
            DelayLoop: @_delay_loop,
            Servers: servers
          }
        end

      end

    end
  end
end
