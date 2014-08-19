# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'

module Saklient
  module Cloud
    module Resource

      # サーバプラン情報の1レコードに対応するクラス.
      class ServerPlan < Saklient::Cloud::Resource::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # 名前
        #
        # @return [String]
        attr_accessor :m_name

        # 仮想コア数
        #
        # @return [Fixnum]
        attr_accessor :m_cpu

        # メモリ容量[MiB]
        #
        # @return [Fixnum]
        attr_accessor :m_memory_mib

        # サービスクラス
        #
        # @return [String]
        attr_accessor :m_service_class

        # @private
        # @return [String]
        def _api_path
          return '/product/server'
        end

        # @private
        # @return [String]
        def _root_key
          return 'ServerPlan'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'ServerPlans'
        end

        public

        # @private
        # @return [String]
        def _class_name
          return 'ServerPlan'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # @ignore
        # @param [any] obj
        # @param [bool] wrapped
        # @param [Saklient::Cloud::Client] client
        def initialize(client, obj, wrapped = false)
          super(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(wrapped, 'bool')
          api_deserialize(obj, wrapped)
        end

        protected

        # @return [Fixnum]
        def get_memory_gib
          return get_memory_mib >> 10
        end

        public

        # @return [Fixnum]
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
        attr_accessor :n_cpu

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Fixnum]
        def get_cpu
          return @m_cpu
        end

        public

        # 仮想コア数
        #
        # @return [Fixnum]
        attr_reader :cpu

        def cpu
          get_cpu
        end

        protected

        # @return [bool]
        attr_accessor :n_memory_mib

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Fixnum]
        def get_memory_mib
          return @m_memory_mib
        end

        public

        # メモリ容量[MiB]
        #
        # @return [Fixnum]
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
          if Saklient::Util::exists_path(r, 'CPU')
            @m_cpu = (Saklient::Util::get_by_path(r, 'CPU')).nil? ? nil : (Saklient::Util::get_by_path(r, 'CPU').to_s).to_i(10)
          else
            @m_cpu = nil
            @is_incomplete = true
          end
          @n_cpu = false
          if Saklient::Util::exists_path(r, 'MemoryMB')
            @m_memory_mib = (Saklient::Util::get_by_path(r, 'MemoryMB')).nil? ? nil : (Saklient::Util::get_by_path(r, 'MemoryMB').to_s).to_i(10)
          else
            @m_memory_mib = nil
            @is_incomplete = true
          end
          @n_memory_mib = false
          if Saklient::Util::exists_path(r, 'ServiceClass')
            @m_service_class = (Saklient::Util::get_by_path(r, 'ServiceClass')).nil? ? nil : Saklient::Util::get_by_path(r, 'ServiceClass').to_s
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
          Saklient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          Saklient::Util::set_by_path(ret, 'Name', @m_name) if withClean || @n_name
          Saklient::Util::set_by_path(ret, 'CPU', @m_cpu) if withClean || @n_cpu
          Saklient::Util::set_by_path(ret, 'MemoryMB', @m_memory_mib) if withClean || @n_memory_mib
          Saklient::Util::set_by_path(ret, 'ServiceClass', @m_service_class) if withClean || @n_service_class
          return ret
        end

      end

    end
  end
end
