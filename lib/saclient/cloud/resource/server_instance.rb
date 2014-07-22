# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative '../util'
require_relative 'resource'
require_relative '../enums/eserver_instance_status'

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

        # サーバが起動しているときtrueを返します.
        #
        # @return [bool]
        def is_up
          return !(get_status).nil? && Saclient::Cloud::Enums::EServerInstanceStatus::compare(get_status, Saclient::Cloud::Enums::EServerInstanceStatus::up) == 0
        end

        # サーバが停止しているときtrueを返します.
        #
        # @return [bool]
        def is_down
          return (get_status).nil? || Saclient::Cloud::Enums::EServerInstanceStatus::compare(get_status, Saclient::Cloud::Enums::EServerInstanceStatus::down) == 0
        end

        protected

        # @return [bool]
        attr_accessor :n_status

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_status
          return @m_status
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
          return @m_before_status
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
          return @m_status_changed_at
        end

        public

        # @return [NativeDate]
        attr_reader :status_changed_at

        def status_changed_at
          get_status_changed_at
        end

        protected

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize_impl(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if Saclient::Cloud::Util::exists_path(r, 'Status')
            @m_status = (Saclient::Cloud::Util::get_by_path(r, 'Status')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'Status').to_s
          else
            @m_status = nil
            @is_incomplete = true
          end
          @n_status = false
          if Saclient::Cloud::Util::exists_path(r, 'BeforeStatus')
            @m_before_status = (Saclient::Cloud::Util::get_by_path(r, 'BeforeStatus')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'BeforeStatus').to_s
          else
            @m_before_status = nil
            @is_incomplete = true
          end
          @n_before_status = false
          if Saclient::Cloud::Util::exists_path(r, 'StatusChangedAt')
            @m_status_changed_at = (Saclient::Cloud::Util::get_by_path(r, 'StatusChangedAt')).nil? ? nil : Saclient::Cloud::Util::get_by_path(r, 'StatusChangedAt').to_s
          else
            @m_status_changed_at = nil
            @is_incomplete = true
          end
          @n_status_changed_at = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          ret = {}
          Saclient::Cloud::Util::set_by_path(ret, 'Status', @m_status) if withClean || @n_status
          Saclient::Cloud::Util::set_by_path(ret, 'BeforeStatus', @m_before_status) if withClean || @n_before_status
          Saclient::Cloud::Util::set_by_path(ret, 'StatusChangedAt', (@m_status_changed_at).nil? ? nil : Saclient::Cloud::Util::date2str(@m_status_changed_at)) if withClean || @n_status_changed_at
          return ret
        end

      end

    end
  end
end
