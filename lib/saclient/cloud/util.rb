# -*- encoding: UTF-8 -*-

require 'uri'

module Saclient
  module Cloud
    
    class Util
      
      # @param [Array] arguments
      # @param [String] classPath
      # @return [any]
      def self.create_class_instance(classPath, arguments)
        ret = nil
        ret = classPath.split('.').inject(Object){ |obj, name| obj.const_get(name[0].upcase+name[1..-1]) }.new(*arguments)
        if (ret).nil?
          raise Exception.new("Could not create class instance of " + classPath)
        end
        ret
      end
      
      # @param [String] s
      # @return [NativeDate]
      def self.str2date(s)
        if (s).nil?
          nil
        end
        DateTime.parse(s)
      end
      
      # @param [NativeDate] d
      # @return [String]
      def self.date2str(d)
        if (d).nil?
          nil
        end
        d.to_s()
      end
      
      # @param [String] s
      # @return [String]
      def self.url_encode(s)
        URI.encode(s)
      end
      
      # @param [U] clazz
      # @param [Array<T>] a
      # @return [Array<U>]
      def self.cast_array(a, clazz)
        a
      end
      
    end
    
  end
end
