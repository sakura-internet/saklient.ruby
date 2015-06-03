# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

module Saklient
  module Cloud
    module Enums

      # スクリプトのクラスを表す列挙子.
      class EScriptClass

        def self.shell
          'shell'
        end

        def self.ansible
          'ansible'
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
          shell:200,
          ansible:300
        }


      end

    end
  end
end
