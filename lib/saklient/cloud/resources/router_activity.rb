# -*- encoding: UTF-8 -*-

require_relative 'activity'
require_relative 'router_activity_sample'

module Saklient
  module Cloud
    module Resources

      class RouterActivity < Saklient::Cloud::Resources::Activity

        protected

        # @private
        # @return [Array<RouterActivitySample>]
        attr_accessor :_samples

        # @private
        # @return [Array<RouterActivitySample>]
        def get_samples
          return @_samples
        end

        public

        # サンプル列
        #
        # @return [Array<RouterActivitySample>]
        attr_reader :samples

        def samples
          get_samples
        end

        protected

        # @private
        # @return [String]
        def _api_path_prefix
          return '/internet'
        end

        # @private
        # @param [String] atStr
        # @param [any] data
        # @return [void]
        def _add_sample(atStr, data)
          Saklient::Util::validate_type(atStr, 'String')
          @_samples << Saklient::Cloud::Resources::RouterActivitySample.new(atStr, data)
        end

        public

        # アクティビティを取得します.
        #
        #  	 * @return アクティビティ
        #
        # @param [NativeDate] startDate
        # @param [NativeDate] endDate
        # @return [RouterActivity]
        def fetch(startDate = nil, endDate = nil)
          Saklient::Util::validate_type(startDate, 'NativeDate')
          Saklient::Util::validate_type(endDate, 'NativeDate')
          @_samples = []
          return _fetch(startDate, endDate)
        end

      end

    end
  end
end
