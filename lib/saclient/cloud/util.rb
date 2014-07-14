# -*- encoding: UTF-8 -*-

require 'uri'

module Saclient
  module Cloud

    class Util

      # @param [String] classPath
      # @param [Array] args
      # @return [any]
      def self.create_class_instance(classPath, args)
        ret = nil
        if !(classPath).nil?
          apath = classPath.split('.')
          ret = apath.inject(Object) { |obj, name| obj.const_get(name[0].upcase + name[1..-1]) }.new(*args)
        end
        raise Exception.new('Could not create class instance of ' + classPath) if (ret).nil?
        return ret
      end

      # @param [String] s
      # @return [NativeDate]
      def self.str2date(s)
        return nil if (s).nil?
        return DateTime.parse(s)
      end

      # @param [NativeDate] d
      # @return [String]
      def self.date2str(d)
        return nil if (d).nil?
        return d.to_s
      end

      # @param [String] s
      # @return [String]
      def self.url_encode(s)
        return URI.encode(s)
      end

      # @param [U] clazz
      # @param [Array<T>] a
      # @return [Array<U>]
      def self.cast_array(a, clazz)
        return a
      end

      # @param [Integer] sec
      def self.sleep(sec)
        super self
      end

    end

  end
end
