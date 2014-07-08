# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative 'resource.rb'

module Saclient
  module Cloud
    module Resource

      # ルータのプラン情報へのアクセス機能を備えたクラス.
      class InternetPlan < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_name

        # @return [Integer]
        attr_accessor :m_band_width_mbps

        # @return [String]
        attr_accessor :m_service_class

        public

        # @private
        # @return [String]
        def _id
          get_id
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end

        protected

        # @return [bool]
        attr_accessor :n_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_id
          @m_id
        end

        public

        # @return [String]
        attr_reader :id

        def id
          get_id
        end

        protected

        # @return [bool]
        attr_accessor :n_name

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_name
          @m_name
        end

        public

        # @return [String]
        attr_reader :name

        def name
          get_name
        end

        protected

        # @return [bool]
        attr_accessor :n_band_width_mbps

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Integer]
        def get_band_width_mbps
          @m_band_width_mbps
        end

        public

        # @return [Integer]
        attr_reader :band_width_mbps

        def band_width_mbps
          get_band_width_mbps
        end

        protected

        # @return [bool]
        attr_accessor :n_service_class

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_service_class
          @m_service_class
        end

        public

        # @return [String]
        attr_reader :service_class

        def service_class
          get_service_class
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if !r.nil? && r.key?(:ID)
            @m_id = (r[:ID]).nil? ? nil : r[:ID].to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if !r.nil? && r.key?(:Name)
            @m_name = (r[:Name]).nil? ? nil : r[:Name].to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if !r.nil? && r.key?(:BandWidthMbps)
            @m_band_width_mbps = (r[:BandWidthMbps]).nil? ? nil : (r[:BandWidthMbps].to_s).to_i(10)
          else
            @m_band_width_mbps = nil
            @is_incomplete = true
          end
          @n_band_width_mbps = false
          if !r.nil? && r.key?(:ServiceClass)
            @m_service_class = (r[:ServiceClass]).nil? ? nil : r[:ServiceClass].to_s
          else
            @m_service_class = nil
            @is_incomplete = true
          end
          @n_service_class = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:Name] = @m_name if withClean || @n_name
          ret[:BandWidthMbps] = @m_band_width_mbps if withClean || @n_band_width_mbps
          ret[:ServiceClass] = @m_service_class if withClean || @n_service_class
          ret
        end

      end

    end
  end
end
