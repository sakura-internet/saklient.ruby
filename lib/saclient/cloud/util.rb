# -*- encoding: UTF-8 -*-

require 'uri'

module Saclient
  module Cloud

    class Util

      # @param [any] obj
      # @param [String] path
      # @return [any]
      def self.exists_path(obj, path)
        aPath = path.split('.')
        for seg in aPath
          return false if (obj).nil?
          return false if !obj.is_a?(Hash)
          next if seg == ''
          return false if !(!obj.nil? && obj.key?(seg.to_sym))
          obj = obj[seg.to_sym]
        end
        return true
      end

      # @param [any] obj
      # @param [String] path
      # @return [any]
      def self.get_by_path(obj, path)
        aPath = path.split('.')
        for seg in aPath
          return nil if (obj).nil?
          return nil if !obj.is_a?(Hash)
          next if seg == ''
          return nil if !(!obj.nil? && obj.key?(seg.to_sym))
          obj = obj[seg.to_sym]
        end
        return obj
      end

      # @todo array support
      # @todo overwriting
      # @todo writing into children of non-object
      # @param [any] obj
      # @param [any] value
      # @param [String] path
      # @return [void]
      def self.set_by_path(obj, path, value)
        aPath = path.split('.')
        key = aPath.pop
        for seg in aPath
          next if seg == ''
          obj[seg.to_sym] = {} if !(!obj.nil? && obj.key?(seg.to_sym))
          obj = obj[seg.to_sym]
        end
        obj[key.to_sym] = value
      end

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
      # @return [void]
      def self.sleep(sec)
        super self
      end

    end

  end
end
