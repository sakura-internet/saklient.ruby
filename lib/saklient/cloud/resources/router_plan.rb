# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'

module Saklient
  module Cloud
    module Resources

      # ルータ帯域プラン情報の1レコードに対応するクラス.
      class RouterPlan < Saklient::Cloud::Resources::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # 名前
        #
        # @return [String]
        attr_accessor :m_name

        # 帯域幅
        #
        # @return [Fixnum]
        attr_accessor :m_band_width_mbps

        # サービスクラス
        #
        # @return [String]
        attr_accessor :m_service_class

        # @private
        # @return [String]
        def _api_path
          return '/product/internet'
        end

        # @private
        # @return [String]
        def _root_key
          return 'InternetPlan'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'InternetPlans'
        end

        public

        # @private
        # @return [String]
        def _class_name
          return 'RouterPlan'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # @private
        # @param [Saklient::Cloud::Client] client
        # @param [any] obj
        # @param [bool] wrapped
        def initialize(client, obj, wrapped = false)
          super(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(wrapped, 'bool')
          api_deserialize(obj, wrapped)
        end

        protected

        # @return [bool]
        attr_accessor :n_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_id
          return @m_id
        end

        public

        # ID
        #
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
        # @private
        # @return [String]
        def get_name
          return @m_name
        end

        public

        # 名前
        #
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
        # @private
        # @return [Fixnum]
        def get_band_width_mbps
          return @m_band_width_mbps
        end

        public

        # 帯域幅
        #
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
        # @private
        # @return [String]
        def get_service_class
          return @m_service_class
        end

        public

        # サービスクラス
        #
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
          if Saklient::Util::exists_path(r, 'ID')
            @m_id = (Saklient::Util::get_by_path(r, 'ID')).nil? ? nil : Saklient::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saklient::Util::exists_path(r, 'Name')
            @m_name = (Saklient::Util::get_by_path(r, 'Name')).nil? ? nil : Saklient::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saklient::Util::exists_path(r, 'BandWidthMbps')
            @m_band_width_mbps = (Saklient::Util::get_by_path(r, 'BandWidthMbps')).nil? ? nil : (Saklient::Util::get_by_path(r, 'BandWidthMbps').to_s).to_s().to_i(10)
          else
            @m_band_width_mbps = nil
            @is_incomplete = true
          end
          @n_band_width_mbps = false
          if Saklient::Util::exists_path(r, 'ServiceClass')
            @m_service_class = (Saklient::Util::get_by_path(r, 'ServiceClass')).nil? ? nil : Saklient::Util::get_by_path(r, 'ServiceClass').to_s
          else
            @m_service_class = nil
            @is_incomplete = true
          end
          @n_service_class = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saklient::Util::set_by_path(ret, 'Name', @m_name) if withClean || @n_name
          Saklient::Util::set_by_path(ret, 'BandWidthMbps', @m_band_width_mbps) if withClean || @n_band_width_mbps
          Saklient::Util::set_by_path(ret, 'ServiceClass', @m_service_class) if withClean || @n_service_class
          return ret
        end

      end

    end
  end
end
