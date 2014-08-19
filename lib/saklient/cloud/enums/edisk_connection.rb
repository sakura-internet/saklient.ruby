# -*- encoding: UTF-8 -*-

module Saklient
  module Cloud
    module Enums

      # ディスクの接続方式を表す列挙子.
      class EDiskConnection

        def self.ide
          'ide'
        end

        def self.virtio
          'virtio'
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
          ide:100,
          virtio:300
        }


      end

    end
  end
end
