# -*- encoding: UTF-8 -*-

require_relative '../../util'
require_relative '../client'
require_relative 'script'

module Saklient
  module Cloud
    module Resources

      # ディスク修正のパラメータ.
      class DiskConfig

        protected

        # @private
        # @return [Saklient::Cloud::Client]
        attr_accessor :_client

        # @private
        # @return [Saklient::Cloud::Client]
        def get_client
          return @_client
        end

        public

        # @private
        # @return [Saklient::Cloud::Client]
        attr_reader :client

        def client
          get_client
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_disk_id

        # @private
        # @return [String]
        def get_disk_id
          return @_disk_id
        end

        public

        # @private
        # @return [String]
        attr_reader :disk_id

        def disk_id
          get_disk_id
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_host_name

        # @private
        # @return [String]
        def get_host_name
          return @_host_name
        end

        # @private
        # @param [String] v
        # @return [String]
        def set_host_name(v)
          Saklient::Util::validate_type(v, 'String')
          @_host_name = v
          return v
        end

        public

        # ホスト名
        #
        # @return [String]
        attr_accessor :host_name

        def host_name
          get_host_name
        end

        def host_name=(v)
          set_host_name(v)
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_password

        # @private
        # @return [String]
        def get_password
          return @_password
        end

        # @private
        # @param [String] v
        # @return [String]
        def set_password(v)
          Saklient::Util::validate_type(v, 'String')
          @_password = v
          return v
        end

        public

        # ログインパスワード
        #
        # @return [String]
        attr_accessor :password

        def password
          get_password
        end

        def password=(v)
          set_password(v)
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_ssh_key

        # @private
        # @return [String]
        def get_ssh_key
          return @_ssh_key
        end

        # @private
        # @param [String] v
        # @return [String]
        def set_ssh_key(v)
          Saklient::Util::validate_type(v, 'String')
          @_ssh_key = v
          return v
        end

        public

        # SSHキー
        #
        # @return [String]
        attr_accessor :ssh_key

        def ssh_key
          get_ssh_key
        end

        def ssh_key=(v)
          set_ssh_key(v)
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_ip_address

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
          return v
        end

        public

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
        # @return [String]
        attr_accessor :_default_route

        # @private
        # @return [String]
        def get_default_route
          return @_default_route
        end

        # @private
        # @param [String] v
        # @return [String]
        def set_default_route(v)
          Saklient::Util::validate_type(v, 'String')
          @_default_route = v
          return v
        end

        public

        # デフォルトルート
        #
        # @return [String]
        attr_accessor :default_route

        def default_route
          get_default_route
        end

        def default_route=(v)
          set_default_route(v)
        end

        protected

        # @private
        # @return [Fixnum]
        attr_accessor :_network_mask_len

        # @private
        # @return [Fixnum]
        def get_network_mask_len
          return @_network_mask_len
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_network_mask_len(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          @_network_mask_len = v
          return v
        end

        public

        # ネットワークマスク長
        #
        # @return [Fixnum]
        attr_accessor :network_mask_len

        def network_mask_len
          get_network_mask_len
        end

        def network_mask_len=(v)
          set_network_mask_len(v)
        end

        protected

        # @private
        # @return [Array<Script>]
        attr_accessor :_scripts

        # @private
        # @return [Array<Script>]
        def get_scripts
          return @_scripts
        end

        public

        # スタートアップスクリプト {Script} の配列（pushによりスクリプトを追加できます）
        #
        # @return [Array<Script>]
        attr_reader :scripts

        def scripts
          get_scripts
        end

        # @private
        # @param [Saklient::Cloud::Client] client
        # @param [String] diskId
        def initialize(client, diskId)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(diskId, 'String')
          @_client = client
          @_disk_id = diskId
          @_host_name = nil
          @_password = nil
          @_ssh_key = nil
          @_ip_address = nil
          @_default_route = nil
          @_network_mask_len = nil
          @_scripts = []
        end

        # スタートアップスクリプトを追加します.
        #
        # diskConfig.addScript(script) と diskConfig.scripts.push(script) の効果は同等です.
        #
        # @param [Script] script
        # @return [DiskConfig] this
        def add_script(script)
          Saklient::Util::validate_type(script, 'Saklient::Cloud::Resources::Script')
          @_scripts << script
          return self
        end

        # 修正内容を実際のディスクに書き込みます.
        #
        # @return [DiskConfig] this
        def write
          q = {}
          Saklient::Util::set_by_path(q, 'HostName', @_host_name) if !(@_host_name).nil?
          Saklient::Util::set_by_path(q, 'Password', @_password) if !(@_password).nil?
          Saklient::Util::set_by_path(q, 'SSHKey.PublicKey', @_ssh_key) if !(@_ssh_key).nil?
          Saklient::Util::set_by_path(q, 'UserIPAddress', @_ip_address) if !(@_ip_address).nil?
          Saklient::Util::set_by_path(q, 'UserSubnet.DefaultRoute', @_default_route) if !(@_default_route).nil?
          Saklient::Util::set_by_path(q, 'UserSubnet.NetworkMaskLen', @_network_mask_len) if !(@_network_mask_len).nil?
          if 0 < @_scripts.length
            notes = []
            for script in @_scripts
              notes << { ID: script._id }
            end
            Saklient::Util::set_by_path(q, 'Notes', notes)
          end
          path = '/disk/' + @_disk_id + '/config'
          @_client.request('PUT', path, q)
          return self
        end

      end

    end
  end
end
