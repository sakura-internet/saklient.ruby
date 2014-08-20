# -*- encoding: UTF-8 -*-

module Saklient
  module Cloud
    module Enums

      # リソースの有効性を表す列挙子.
      class EAvailability

        def self.selectable
          'selectable'
        end

        def self.migrating
          'migrating'
        end

        def self.precreate
          'precreate'
        end

        def self.replicating
          'replicating'
        end

        def self.transfering
          'transfering'
        end

        def self.stopped
          'stopped'
        end

        def self.failed
          'failed'
        end

        def self.charged
          'charged'
        end

        def self.uploading
          'uploading'
        end

        def self.available
          'available'
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
          selectable:69,
          migrating:70,
          precreate:71,
          replicating:72,
          transfering:73,
          stopped:75,
          failed:78,
          charged:79,
          uploading:80,
          available:100
        }


      end

    end
  end
end
