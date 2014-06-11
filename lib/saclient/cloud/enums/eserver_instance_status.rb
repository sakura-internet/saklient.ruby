# -*- encoding: UTF-8 -*-

module Saclient
  module Cloud
    module Enums
      
      class EServerInstanceStatus
        
        def self.down() "down" end
        
        def self.cleaning() "cleaning" end
        
        def self.starting() "starting" end
        
        def self.alive() "alive" end
        
        def self.suspended() "suspended" end
        
        def self.running() "running" end
        
        def self.active() "active" end
        
        def self.migrating() "migrating" end
        
        def self.up() "up" end
        
        def self.compare(lhs, rhs)
          l = @@_map[lhs.to_sym]
          r = @@_map[rhs.to_sym]
          return nil if l.nil? or r.nil?
          ret = l - r
          0 < ret ? 1 : (ret < 0 ? -1 : 0)
        end
        
        @@_map = {
          down:0,
          cleaning:5,
          starting:10,
          alive:49,
          suspended:70,
          running:80,
          active:89,
          migrating:90,
          up:100
        }
        
        
      end
      
    end
  end
end
