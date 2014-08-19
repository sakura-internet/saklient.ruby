# -*- encoding: UTF-8 -*-

module Saklient
  module Cloud
    module Enums

      # サーバの起動状態を表す列挙子.
      class EServerInstanceStatus

        def self.down
          'down'
        end

        def self.cleaning
          'cleaning'
        end

        def self.up
          'up'
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
          down:0,
          cleaning:5,
          up:100
        }


      end

    end
  end
end
