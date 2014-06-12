# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative '../util.rb'
require_relative 'resource.rb'

module Saclient
  module Cloud
    module Resource

      # サーバインスタンスのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class ServerInstance < Saclient::Cloud::Resource::Resource

        protected

        # @return [String]
        attr_accessor :m_status

        # @return [String]
        attr_accessor :m_before_status

        # @return [NativeDate]
        attr_accessor :m_status_changed_at

        public

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end

        protected

        # @return [bool]
        attr_accessor :n_status

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_status
          @m_status
        end

        public

        # @return [String]
        attr_reader :status

        def status
          get_status
        end

        protected

        # @return [bool]
        attr_accessor :n_before_status

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_before_status
          @m_before_status
        end

        public

        # @return [String]
        attr_reader :before_status

        def before_status
          get_before_status
        end

        protected

        # @return [bool]
        attr_accessor :n_status_changed_at

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [NativeDate]
        def get_status_changed_at
          @m_status_changed_at
        end

        public

        # @return [NativeDate]
        attr_reader :status_changed_at

        def status_changed_at
          get_status_changed_at
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize(r)
          @is_incomplete = true
          if !r.nil? && r.key?(:Status)
            @m_status = (r[:Status]).nil? ? nil : r[:Status].to_s
            @n_status = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:BeforeStatus)
            @m_before_status = (r[:BeforeStatus]).nil? ? nil : r[:BeforeStatus].to_s
            @n_before_status = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:StatusChangedAt)
            @m_status_changed_at = (r[:StatusChangedAt]).nil? ? nil : r[:StatusChangedAt].to_s
            @n_status_changed_at = false
          else
            @is_incomplete = false
          end
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize(withClean = false)
          ret = {}
          ret[:Status] = @m_status if withClean || @n_status
          ret[:BeforeStatus] = @m_before_status if withClean || @n_before_status
          ret[:StatusChangedAt] = (@m_status_changed_at).nil? ? nil : Saclient::Cloud::Util.date2str(@m_status_changed_at) if withClean || @n_status_changed_at
          ret
        end

      end

    end
  end
end
