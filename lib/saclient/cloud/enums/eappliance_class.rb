# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Enums

      class EApplianceClass

        def self.loadbalancer
          'loadbalancer'
        end

        def self.vpcrouter
          'vpcrouter'
        end

        def self.compare(lhs, rhs)
          return nil if lhs.nil? || rhs.nil?
          l = @@_map[lhs.to_sym]
          r = @@_map[rhs.to_sym]
          return nil if l.nil? || r.nil?
          ret = l - r
          0 < ret ? 1 : (ret < 0 ? -1 : 0)
        end

        @@_map = {
          loadbalancer:10,
          vpcrouter:20
        }


      end

    end
  end
end
