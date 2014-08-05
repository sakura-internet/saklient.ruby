# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'

module Saclient
  module Cloud
    module Resource

      # ルータのプラン情報へのアクセス機能を備えたクラス.
      class RouterPlan < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_name

        # @return [Fixnum]
        attr_accessor :m_band_width_mbps

        # @return [String]
        attr_accessor :m_service_class

        public

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          Saclient::Util::validate_type(client, 'Saclient::Cloud::Client')
          api_deserialize(r)
        end

        protected

        # @return [bool]
        attr_accessor :n_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_id
          return @m_id
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
          return @m_name
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
        # @return [Fixnum]
        def get_band_width_mbps
          return @m_band_width_mbps
        end

        public

        # @return [Fixnum]
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
          return @m_service_class
        end

        public

        # @return [String]
        attr_reader :service_class

        def service_class
          get_service_class
        end

        protected

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize_impl(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if Saclient::Util::exists_path(r, 'ID')
            @m_id = (Saclient::Util::get_by_path(r, 'ID')).nil? ? nil : Saclient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saclient::Util::exists_path(r, 'Name')
            @m_name = (Saclient::Util::get_by_path(r, 'Name')).nil? ? nil : Saclient::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saclient::Util::exists_path(r, 'BandWidthMbps')
            @m_band_width_mbps = (Saclient::Util::get_by_path(r, 'BandWidthMbps')).nil? ? nil : (Saclient::Util::get_by_path(r, 'BandWidthMbps').to_s).to_i(10)
          else
            @m_band_width_mbps = nil
            @is_incomplete = true
          end
          @n_band_width_mbps = false
          if Saclient::Util::exists_path(r, 'ServiceClass')
            @m_service_class = (Saclient::Util::get_by_path(r, 'ServiceClass')).nil? ? nil : Saclient::Util::get_by_path(r, 'ServiceClass').to_s
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
        def api_serialize_impl(withClean = false)
          Saclient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saclient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saclient::Util::set_by_path(ret, 'Name', @m_name) if withClean || @n_name
          Saclient::Util::set_by_path(ret, 'BandWidthMbps', @m_band_width_mbps) if withClean || @n_band_width_mbps
          Saclient::Util::set_by_path(ret, 'ServiceClass', @m_service_class) if withClean || @n_service_class
          return ret
        end

      end

    end
  end
end
