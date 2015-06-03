# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator


module Saklient
  module Cloud
    module Models

      # @private
      class QueryParams

        # @return [Fixnum]
        attr_accessor :begin

        # @return [Fixnum]
        attr_accessor :count

        # @return [any]
        attr_accessor :filter

        # @return [Array<String>]
        attr_accessor :sort

        def initialize
          @begin = 0
          @count = 0
          @filter = {}
          @sort = []
        end

        # @return [any]
        def build
          return {
            From: @begin,
            Count: @count,
            Filter: @filter,
            Sort: @sort
          }
        end

      end

    end
  end
end
