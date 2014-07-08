# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative 'resource.rb'

module Saclient
  module Cloud
    module Resource

      # ディスクのプラン情報へのアクセス機能を備えたクラス.
      class DiskPlan < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_id

        # @return [String]
        attr_accessor :m_name

        # @return [String]
        attr_accessor :m_storage_class

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
        attr_accessor :n_storage_class

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_storage_class
          @m_storage_class
        end

        public

        # @return [String]
        attr_reader :storage_class

        def storage_class
          get_storage_class
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
          if !r.nil? && r.key?(:StorageClass)
            @m_storage_class = (r[:StorageClass]).nil? ? nil : r[:StorageClass].to_s
          else
            @m_storage_class = nil
            @is_incomplete = true
          end
          @n_storage_class = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:Name] = @m_name if withClean || @n_name
          ret[:StorageClass] = @m_storage_class if withClean || @n_storage_class
          ret
        end

      end

    end
  end
end
