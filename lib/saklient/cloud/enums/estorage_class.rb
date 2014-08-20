# -*- encoding: UTF-8 -*-

module Saklient
  module Cloud
    module Enums

      # ストレージのクラスを表す列挙子.
      class EStorageClass

        def self.iscsi1204
          'iscsi1204'
        end

        # @private
        def self.compare(lhs, rhs)
          return nil if lhs.nil? || rhs.nil?
          l = @@_map[lhs.to_sym]
          r = @@_map[rhs.to_sym]
          return nil if l.nil? || r.nil?
          ret = l - r
          0 < ret ? 1 : (ret < 0 ? -1 : 0)
        end

        # @private
        @@_map = {
          iscsi1204:110
        }


      end

    end
  end
end
