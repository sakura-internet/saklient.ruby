# -*- encoding: UTF-8 -*-

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'appliance'
require_relative 'lb_virtual_ip'
require_relative 'swytch'
require_relative 'ipv4_net'
require_relative '../enums/eappliance_class'

module Saklient
  module Cloud
    module Resources

      # ロードバランサの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class LoadBalancer < Saklient::Cloud::Resources::Appliance

        protected

        # @private
        # @return [Array<LbVirtualIp>]
        attr_accessor :_virtual_ips

        public

        # @private
        # @return [Array<LbVirtualIp>]
        def get_virtual_ips
          return @_virtual_ips
        end

        # 仮想IPアドレス
        #
        # @return [Array<LbVirtualIp>]
        attr_reader :virtual_ips

        def virtual_ips
          get_virtual_ips
        end

        # @private
        # @return [String]
        def get_swytch_id
          return Saklient::Util::get_by_path(self.raw_annotation, 'Switch.ID')
        end

        # スイッチID
        #
        # @return [String]
        attr_reader :swytch_id

        def swytch_id
          get_swytch_id
        end

        # @private
        # @return [String]
        def get_default_route
          return Saklient::Util::get_by_path(self.raw_annotation, 'Network.DefaultRoute')
        end

        # @private
        # @param [String] v
        # @return [String]
        def set_default_route(v)
          Saklient::Util::validate_type(v, 'String')
          Saklient::Util::set_by_path(self.raw_annotation, 'Network.DefaultRoute', v)
          return v
        end

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

        # @private
        # @return [Fixnum]
        def get_mask_len
          maskLen = Saklient::Util::get_by_path(self.raw_annotation, 'Network.NetworkMaskLen')
          raise Saklient::Errors::SaklientException.new('invalid_data', 'Data of the resource is invalid') if (maskLen).nil?
          return (maskLen).to_s().to_i(10)
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_mask_len(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          Saklient::Util::set_by_path(self.raw_annotation, 'Network.NetworkMaskLen', v)
          return v
        end

        # マスク長
        #
        # @return [Fixnum]
        attr_accessor :mask_len

        def mask_len
          get_mask_len
        end

        def mask_len=(v)
          set_mask_len(v)
        end

        # @private
        # @return [Fixnum]
        def get_vrid
          vrid = Saklient::Util::get_by_path(self.raw_annotation, 'VRRP.VRID')
          raise Saklient::Errors::SaklientException.new('invalid_data', 'Data of the resource is invalid') if (vrid).nil?
          return (vrid).to_s().to_i(10)
        end

        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_vrid(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          Saklient::Util::set_by_path(self.raw_annotation, 'VRRP.VRID', v)
          return v
        end

        # VRID
        #
        # @return [Fixnum]
        attr_accessor :vrid

        def vrid
          get_vrid
        end

        def vrid=(v)
          set_vrid(v)
        end

        # @private
        # @param [Saklient::Cloud::Client] client
        # @param [any] obj
        # @param [bool] wrapped
        def initialize(client, obj, wrapped = false)
          super(client, obj, wrapped)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(wrapped, 'bool')
          self.raw_annotation = {} if (self.raw_annotation).nil?
        end

        protected

        # @private
        # @param [any] r
        # @param [any] root
        # @return [void]
        def _on_after_api_deserialize(r, root)
          self.raw_annotation = {} if (self.raw_annotation).nil?
          @_virtual_ips = []
          settings = self.raw_settings
          if !(settings).nil?
            lb = settings[:LoadBalancer]
            lb = [] if (lb).nil?
            vips = lb
            for vip in vips
              @_virtual_ips << Saklient::Cloud::Resources::LbVirtualIp.new(vip)
            end
          end
        end

        # @private
        # @param [bool] withClean
        # @return [void]
        def _on_before_api_serialize(withClean)
          Saklient::Util::validate_type(withClean, 'bool')
          lb = []
          for vip in @_virtual_ips
            lb << vip.to_raw_settings
          end
          self.raw_settings = {} if (self.raw_settings).nil?
          self.raw_settings[:LoadBalancer] = lb
          self.clazz = Saklient::Cloud::Enums::EApplianceClass::loadbalancer
        end

        public

        # @private
        # @param [Swytch] swytch
        # @param [Fixnum] vrid
        # @param [Array<String>] realIps
        # @param [bool] isHighSpec
        # @return [LoadBalancer]
        def set_initial_params(swytch, vrid, realIps, isHighSpec = false)
          Saklient::Util::validate_type(swytch, 'Saklient::Cloud::Resources::Swytch')
          Saklient::Util::validate_type(vrid, 'Fixnum')
          Saklient::Util::validate_type(realIps, 'Array')
          Saklient::Util::validate_type(isHighSpec, 'bool')
          annot = self.raw_annotation
          self.vrid = vrid
          Saklient::Util::set_by_path(annot, 'Switch.ID', swytch._id)
          if 0 < swytch.ipv4_nets.length
            net = swytch.ipv4_nets[0]
            self.default_route = net.default_route
            self.mask_len = net.mask_len
          else
            self.default_route = swytch.user_default_route
            self.mask_len = swytch.user_mask_len
          end
          servers = []
          for ip in realIps
            servers << { IPAddress: ip }
          end
          Saklient::Util::set_by_path(annot, 'Servers', servers)
          self.plan_id = isHighSpec ? 2 : 1
          return self
        end

        # @param [any] settings
        # @return [LoadBalancer]
        def add_virtual_ip(settings)
          @_virtual_ips << Saklient::Cloud::Resources::LbVirtualIp.new(settings)
          return self
        end

        # @param [String] address
        # @return [LbVirtualIp]
        def get_virtual_ip_by_address(address)
          Saklient::Util::validate_type(address, 'String')
          for vip in @_virtual_ips
            return vip if vip.virtual_ip_address == address
          end
          return nil
        end

      end

    end
  end
end
