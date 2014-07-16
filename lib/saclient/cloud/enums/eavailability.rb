# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Enums

      class EAvailability

        def self.unavailable
          'unavailable'
        end

        def self.creating
          'creating'
        end

        def self.prepared
          'prepared'
        end

        def self.discontinued
          'discontinued'
        end

        def self.visible
          'visible'
        end

        def self.abnormal
          'abnormal'
        end

        def self.recoverable
          'recoverable'
        end

        def self.disabled
          'disabled'
        end

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

        def self.compare(lhs, rhs)
          return nil if lhs.nil? || rhs.nil?
          l = @@_map[lhs.to_sym]
          r = @@_map[rhs.to_sym]
          return nil if l.nil? || r.nil?
          ret = l - r
          0 < ret ? 1 : (ret < 0 ? -1 : 0)
        end

        @@_map = {
          unavailable:0,
          creating:10,
          prepared:20,
          discontinued:30,
          visible:49,
          abnormal:50,
          recoverable:59,
          disabled:60,
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
