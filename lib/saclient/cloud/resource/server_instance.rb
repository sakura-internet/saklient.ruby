# -*- encoding: UTF-8 -*-

require_relative '../../util'
require_relative '../client'
require_relative 'resource'
require_relative 'iso_image'
require_relative '../enums/eserver_instance_status'

module Saclient
  module Cloud
    module Resource

      # サーバインスタンスのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class ServerInstance < Saclient::Cloud::Resource::Resource

        protected

        # 起動状態
        #
        # @return [String]
        attr_accessor :m_status

        # 前回の起動状態
        #
        # @return [String]
        attr_accessor :m_before_status

        # 現在の起動状態に変化した日時
        #
        # @return [NativeDate]
        attr_accessor :m_status_changed_at

        # 挿入されているISOイメージ
        #
        # @return [IsoImage]
        attr_accessor :m_iso_image

        public

        # @private
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          Saclient::Util::validate_type(client, 'Saclient::Cloud::Client')
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

        # 起動状態
        #
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

        # 前回の起動状態
        #
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

        # 現在の起動状態に変化した日時
        #
        # @return [NativeDate]
        attr_reader :status_changed_at

        def status_changed_at
          get_status_changed_at
        end

        protected

        # @return [bool]
        attr_accessor :n_iso_image

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [IsoImage]
        def get_iso_image
          return @m_iso_image
        end

        public

        # 挿入されているISOイメージ
        #
        # @return [IsoImage]
        attr_reader :iso_image

        def iso_image
          get_iso_image
        end

        protected

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize_impl(r)
          @is_new = (r).nil?
          r = {} if @is_new
          @is_incomplete = false
          if Saclient::Util::exists_path(r, 'Status')
            @m_status = (Saclient::Util::get_by_path(r, 'Status')).nil? ? nil : Saclient::Util::get_by_path(r, 'Status').to_s
          else
            @m_status = nil
            @is_incomplete = true
          end
          @n_status = false
          if Saclient::Util::exists_path(r, 'BeforeStatus')
            @m_before_status = (Saclient::Util::get_by_path(r, 'BeforeStatus')).nil? ? nil : Saclient::Util::get_by_path(r, 'BeforeStatus').to_s
          else
            @m_before_status = nil
            @is_incomplete = true
          end
          @n_before_status = false
          if Saclient::Util::exists_path(r, 'StatusChangedAt')
            @m_status_changed_at = (Saclient::Util::get_by_path(r, 'StatusChangedAt')).nil? ? nil : Saclient::Util::get_by_path(r, 'StatusChangedAt').to_s
          else
            @m_status_changed_at = nil
            @is_incomplete = true
          end
          @n_status_changed_at = false
          if Saclient::Util::exists_path(r, 'CDROM')
            @m_iso_image = (Saclient::Util::get_by_path(r, 'CDROM')).nil? ? nil : Saclient::Cloud::Resource::IsoImage.new(@_client, Saclient::Util::get_by_path(r, 'CDROM'))
          else
            @m_iso_image = nil
            @is_incomplete = true
          end
          @n_iso_image = false
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saclient::Util::validate_type(withClean, 'bool')
          ret = {}
          Saclient::Util::set_by_path(ret, 'Status', @m_status) if withClean || @n_status
          Saclient::Util::set_by_path(ret, 'BeforeStatus', @m_before_status) if withClean || @n_before_status
          Saclient::Util::set_by_path(ret, 'StatusChangedAt', (@m_status_changed_at).nil? ? nil : Saclient::Util::date2str(@m_status_changed_at)) if withClean || @n_status_changed_at
          Saclient::Util::set_by_path(ret, 'CDROM', withClean ? ((@m_iso_image).nil? ? nil : @m_iso_image.api_serialize(withClean)) : ((@m_iso_image).nil? ? { ID: '0' } : @m_iso_image.api_serialize_id)) if withClean || @n_iso_image
          return ret
        end

      end

    end
  end
end
