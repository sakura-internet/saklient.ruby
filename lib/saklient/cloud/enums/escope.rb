# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

module Saklient
  module Cloud
    module Enums

      # リソースの公開範囲を表す列挙子.
      class EScope

        def self.user
          'user'
        end

        def self.shared
          'shared'
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
          user:100,
          shared:200
        }


      end

    end
  end
end
