# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative '../util'

module Saclient
  module Cloud
    module Resource

      # ディスク修正のパラメータ
      class DiskConfig

        protected

        # @private
        # @return [Saclient::Cloud::Client]
        attr_accessor :_client

        # @return [Saclient::Cloud::Client]
        def get_client
          return @_client
        end

        public

        # @return [Saclient::Cloud::Client]
        attr_reader :client

        def client
          get_client
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_disk_id

        # @return [String]
        def get_disk_id
          return @_disk_id
        end

        public

        # @return [String]
        attr_reader :disk_id

        def disk_id
          get_disk_id
        end

        # @return [String]
        attr_accessor :host_name

        # @return [String]
        attr_accessor :password

        # @return [String]
        attr_accessor :ssh_key

        # @return [String]
        attr_accessor :ip_address

        # @return [String]
        attr_accessor :gateway

        # @return [Integer]
        attr_accessor :network_mask_len

        # @private
        # @param [String] diskId
        # @param [Saclient::Cloud::Client] client
        def initialize(client, diskId)
          @_client = client
          @_disk_id = diskId
          @host_name = nil
          @password = nil
          @ssh_key = nil
          @ip_address = nil
          @gateway = nil
          @network_mask_len = nil
        end

        # *
        #
        # @return [DiskConfig]
        def write
          q = {}
          Saclient::Cloud::Util::set_by_path(q, 'HostName', @host_name) if !(@host_name).nil?
          Saclient::Cloud::Util::set_by_path(q, 'Password', @password) if !(@password).nil?
          Saclient::Cloud::Util::set_by_path(q, 'SSHKey.PublicKey', @ssh_key) if !(@ssh_key).nil?
          Saclient::Cloud::Util::set_by_path(q, 'UserIPAddress', @ip_address) if !(@ip_address).nil?
          Saclient::Cloud::Util::set_by_path(q, 'UserSubnet.DefaultRoute', @gateway) if !(@gateway).nil?
          Saclient::Cloud::Util::set_by_path(q, 'UserSubnet.NetworkMaskLen', @network_mask_len) if !(@network_mask_len).nil?
          path = '/disk/' + @_disk_id + '/config'
          result = @_client.request('PUT', path, q)
          return self
        end

      end

    end
  end
end
