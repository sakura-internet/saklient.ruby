# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Enums

      class EScope

        def self.user
          'user'
        end

        def self.shared
          'shared'
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
          user:100,
          shared:200
        }


      end

    end
  end
end
