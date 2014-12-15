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

        # @private
        # @param [String] v
        # @return [String]
        def set_virtual_ip_address(v)
          Saklient::Util::validate_type(v, 'String')
          @_virtual_ip_address = v
          return @_virtual_ip_address
        end

        # VIPアドレス
        #
        # @return [String]
        attr_accessor :virtual_ip_address

        def virtual_ip_address
          get_virtual_ip_address
        end

        def virtual_ip_address=(v)
          set_virtual_ip_address(v)
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
        # @return [Fixnum]
        attr_accessor :_delay_loop

        public

        # @private
        # @return [Fixnum]
        def get_delay_loop
          return @_delay_loop
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_delay_loop(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          @_delay_loop = v
          return @_delay_loop
        end

        # チェック間隔 [秒]
        #
        # @return [Fixnum]
        attr_accessor :delay_loop

        def delay_loop
          get_delay_loop
        end

        def delay_loop=(v)
          set_delay_loop(v)
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

        # 実サーバ {LbServer} の配列
        #
        # @return [Array<LbServer>]
        attr_reader :servers

        def servers
          get_servers
        end

        # @private
        # @param [any] obj
        def initialize(obj = nil)
          obj = {} if (obj).nil?
          vip = Saklient::Util::get_by_path_any([obj], [
            'VirtualIPAddress',
            'virtualIpAddress',
            'virtual_ip_address',
            'vip'
          ])
          @_virtual_ip_address = vip
          port = Saklient::Util::get_by_path_any([obj], ['Port', 'port'])
          @_port = nil
          @_port = (port).to_s().to_i(10) if !(port).nil?
          @_port = nil if @_port == 0
          delayLoop = Saklient::Util::get_by_path_any([obj], [
            'DelayLoop',
            'delayLoop',
            'delay_loop',
            'delay'
          ])
          @_delay_loop = nil
          @_delay_loop = (delayLoop).to_s().to_i(10) if !(delayLoop).nil?
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
        # @return [LbServer]
        def add_server(settings = nil)
          ret = Saklient::Cloud::Resources::LbServer.new(settings)
          @_servers << ret
          return ret
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

        # @param [String] address
        # @return [LbServer]
        def get_server_by_address(address)
          Saklient::Util::validate_type(address, 'String')
          for srv in @_servers
            return srv if srv.ip_address == address
          end
          return nil
        end

        # @param [Array] srvs
        # @return [LbVirtualIp]
        def update_status(srvs)
          Saklient::Util::validate_type(srvs, 'Array')
          for srvDyn in srvs
            ip = srvDyn[:IPAddress]
            srv = get_server_by_address(ip)
            next if (srv).nil?
            srv.update_status(srvDyn)
          end
          return self
        end

      end

    end
  end
end
