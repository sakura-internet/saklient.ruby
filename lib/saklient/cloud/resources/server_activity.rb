# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../client'
require_relative 'activity'
require_relative 'server_activity_sample'

module Saklient
  module Cloud
    module Resources

      class ServerActivity < Saklient::Cloud::Resources::Activity

        protected

        # @private
        # @return [Array<ServerActivitySample>]
        attr_accessor :_samples

        # @private
        # @return [Array<ServerActivitySample>]
        def get_samples
          return @_samples
        end

        public

        # サンプル列
        #
        # @return [Array<ServerActivitySample>]
        attr_reader :samples

        def samples
          get_samples
        end

        protected

        # @private
        # @return [String]
        def _api_path_prefix
          return '/server'
        end

        public

        # @private
        # @param [Saklient::Cloud::Client] client
        def initialize(client)
          super(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
        end

        protected

        # @private
        # @param [String] atStr
        # @param [any] data
        # @return [void]
        def _add_sample(atStr, data)
          Saklient::Util::validate_type(atStr, 'String')
          @_samples << Saklient::Cloud::Resources::ServerActivitySample.new(atStr, data)
        end

        public

        # 現在の最新のアクティビティ情報を取得し, samplesに格納します.
        #
        #  	 * @return this
        #
        # @param [NativeDate] startDate
        # @param [NativeDate] endDate
        # @return [ServerActivity]
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
