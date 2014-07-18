# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'

module Saclient
  module Cloud
    module Resource

      # サーバのプラン情報へのアクセス機能を備えたクラス.
      class ServerPlan < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_name

        # @return [Integer]
        attr_accessor :m_cpu

        # @return [Integer]
        attr_accessor :m_memory_mib

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
          api_deserialize(r)
        end

        protected

        # @return [Integer]
        def get_memory_gib
          return get_memory_mib >> 10
        end

        public

        # @return [Integer]
        attr_reader :memory_gib

        def memory_gib
          get_memory_gib
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
        attr_accessor :n_cpu

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Integer]
        def get_cpu
          return @m_cpu
        end

        public

        # @return [Integer]
        attr_reader :cpu

        def cpu
          get_cpu
        end

        protected

        # @return [bool]
        attr_accessor :n_memory_mib

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Integer]
        def get_memory_mib
          return @m_memory_mib
        end

        public

        # @return [Integer]
        attr_reader :memory_mib

        def memory_mib
          get_memory_mib
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
          if Saclient::Cloud::Util::exists_path(r, 'ID')
            @m_id = (Saclient::Cloud::Util::get_by_path(r, 'ID')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'ID').to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if Saclient::Cloud::Util::exists_path(r, 'Name')
            @m_name = (Saclient::Cloud::Util::get_by_path(r, 'Name')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'Name').to_s
          else
            @m_name = nil
            @is_incomplete = true
          end
          @n_name = false
          if Saclient::Cloud::Util::exists_path(r, 'CPU')
            @m_cpu = (Saclient::Cloud::Util::get_by_path(r, 'CPU')).nil? ? nil : (Saclient::Cloud::Util::get_by_path(r, 'CPU').to_s).to_i(10)
          else
            @m_cpu = nil
            @is_incomplete = true
          end
          @n_cpu = false
          if Saclient::Cloud::Util::exists_path(r, 'MemoryMB')
            @m_memory_mib = (Saclient::Cloud::Util::get_by_path(r, 'MemoryMB')).nil? ? nil : (Saclient::Cloud::Util::get_by_path(r, 'MemoryMB').to_s).to_i(10)
          else
            @m_memory_mib = nil
            @is_incomplete = true
          end
          @n_memory_mib = false
          if Saclient::Cloud::Util::exists_path(r, 'ServiceClass')
            @m_service_class = (Saclient::Cloud::Util::get_by_path(r, 'ServiceClass')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'ServiceClass').to_s
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
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:Name] = @m_name if withClean || @n_name
          ret[:CPU] = @m_cpu if withClean || @n_cpu
          ret[:MemoryMB] = @m_memory_mib if withClean || @n_memory_mib
          ret[:ServiceClass] = @m_service_class if withClean || @n_service_class
          return ret
        end

      end

    end
  end
end
