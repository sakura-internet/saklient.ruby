# -*- encoding: UTF-8 -*-

# This code is automatically transpiled by Saklient Translator

require_relative '../../util'
require_relative '../client'

module Saklient
  module Cloud
    module Resources

      class Activity

        protected

        # @private
        # @return [Saklient::Cloud::Client]
        attr_accessor :_client

        # @private
        # @return [String]
        attr_accessor :_source_id

        # @private
        # @return [String]
        def _api_path_prefix
          return nil
        end

        # @private
        # @return [String]
        def _api_path_suffix
          return '/monitor'
        end

        # @private
        # @param [String] atStr
        # @param [any] data
        # @return [void]
        def _add_sample(atStr, data)
          Saklient::Util::validate_type(atStr, 'String')
        end

        public

        # @private
        # @param [Saklient::Cloud::Client] client
        def initialize(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          @_client = client
        end

        # @private
        # @param [String] id
        # @return [void]
        def set_source_id(id)
          Saklient::Util::validate_type(id, 'String')
          @_source_id = id
        end

        # 現在の最新のアクティビティ情報を取得し, samplesに格納します.
        #
        #  	 * @return this
        #
        # @private
        # @param [NativeDate] startDate
        # @param [NativeDate] endDate
        # @return [Activity]
        def _fetch(startDate = nil, endDate = nil)
          Saklient::Util::validate_type(startDate, 'NativeDate')
          Saklient::Util::validate_type(endDate, 'NativeDate')
          query = {}
          query[:Start] = Saklient::Util::date2str(startDate) if !(startDate).nil?
          query[:End] = Saklient::Util::date2str(endDate) if !(endDate).nil?
          path = _api_path_prefix + '/' + Saklient::Util::url_encode(@_source_id) + _api_path_suffix
          data = @_client.request('GET', path)
          return nil if (data).nil?
          data = data[:Data]
          return nil if (data).nil?
          dates = data.keys.map{|k| k.to_s}
          dates = dates.sort()
          for date in dates
            _add_sample(date, data[date.to_sym])
          end
          return self
        end

      end

    end
  end
end
