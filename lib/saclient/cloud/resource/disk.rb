# -*- encoding: UTF-8 -*-

require_relative '../../errors/saclient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'disk_plan'
require_relative 'server'
require_relative 'archive'
require_relative 'disk'
require_relative 'disk_config'
require_relative '../enums/eavailability'
require_relative '../enums/edisk_connection'

module Saclient
  module Cloud
    module Resource

      # ディスクのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Disk < Saclient::Cloud::Resource::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # 名前
        #
        # @return [String]
        attr_accessor :m_name

        # 説明
        #
        # @return [String]
        attr_accessor :m_description

        # タグ
        #
        # @return [Array<String>]
        attr_accessor :m_tags

        # アイコン
        #
        # @return [Icon]
        attr_accessor :m_icon

        # サイズ[MiB]
        #
        # @return [Fixnum]
        attr_accessor :m_size_mib

        # サービスクラス
        #
        # @return [String]
        attr_accessor :m_service_class

        # プラン
        #
        # @return [DiskPlan]
        attr_accessor :m_plan

        # 接続先のサーバ
        #
        # @return [Server]
        attr_accessor :m_server

        # 有効状態
        #
        # @return [String]
        attr_accessor :m_availability

        # @private
        # @return [String]
        def _api_path
          return '/disk'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Disk'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Disks'
        end

        public

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Disk] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Disk] this
        def reload
          return _reload
        end

        # @private
        # @param [any] obj
        # @param [bool] wrapped
        # @param [Saclient::Cloud::Client] client
        def initialize(client, obj, wrapped = false)
          super(client)
          Saclient::Util::validate_type(client, 'Saclient::Cloud::Client')
          Saclient::Util::validate_type(wrapped, 'bool')
          api_deserialize(obj, wrapped)
        end

        protected

        # @return [bool]
        def get_is_available
          return get_availability == Saclient::Cloud::Enums::EAvailability::available
        end

        public

        # ディスクが利用可能なときtrueを返します.
        #
        # @return [bool]
        attr_reader :is_available

        def is_available
          get_is_available
        end

        protected

        # @return [Fixnum]
        def get_size_gib
          return get_size_mib >> 10
        end

        # @param [Fixnum] sizeGib
        # @return [Fixnum]
        def set_size_gib(sizeGib)
          Saclient::Util::validate_type(sizeGib, 'Fixnum')
          set_size_mib(sizeGib * 1024)
          return sizeGib
        end

        public

        # サイズ[GiB]
        #
        # @return [Fixnum]
        attr_accessor :size_gib

        def size_gib
          get_size_gib
        end

        def size_gib=(v)
          set_size_gib(v)
        end

        protected

        # @private
        # @return [any]
        attr_accessor :_source

        public

        # @return [any]
        def get_source
          return @_source
        end

        # @param [any] source
        # @return [any]
        def set_source(source)
          @_source = source
          return source
        end

        # ディスクのコピー元
        #
        # @return [any]
        attr_accessor :source

        def source
          get_source
        end

        def source=(v)
          set_source(v)
        end

        protected

        # @private
        # @param [any] root
        # @param [any] r
        # @return [void]
        def _on_after_api_deserialize(r, root)
          if !(r).nil?
            if !r.nil? && r.key?(:SourceArchive)
              s = r[:SourceArchive]
              if !(s).nil?
                id = s[:ID]
                @_source = Saclient::Cloud::Resource::Archive.new(@_client, s) if !(id).nil?
              end
            end
            if !r.nil? && r.key?(:SourceDisk)
              s = r[:SourceDisk]
              if !(s).nil?
                id = s[:ID]
                @_source = Saclient::Cloud::Resource::Disk.new(@_client, s) if !(id).nil?
              end
            end
          end
        end

        # @private
        # @param [bool] withClean
        # @param [any] r
        # @return [void]
        def _on_after_api_serialize(r, withClean)
          Saclient::Util::validate_type(withClean, 'bool')
          return nil if (r).nil?
          if !(@_source).nil?
            if @_source.is_a?(Saclient::Cloud::Resource::Archive)
              archive = @_source
              s = withClean ? archive.api_serialize(true) : { ID: archive._id }
              r[:SourceArchive] = s
            else
              if @_source.is_a?(Saclient::Cloud::Resource::Disk)
                disk = @_source
                s = withClean ? disk.api_serialize(true) : { ID: disk._id }
                r[:SourceDisk] = s
              else
                @_source = nil
                Saclient::Util::validate_type(@_source, 'Disk or Archive', true)
              end
            end
          end
        end

        public

        # ディスクをサーバに取り付けます.
        #
        # @param [Server] server
        # @return [Disk]
        def connect_to(server)
          Saclient::Util::validate_type(server, 'Saclient::Cloud::Resource::Server')
          @_client.request('PUT', '/disk/' + _id + '/to/server/' + server._id)
          return self
        end

        # ディスクをサーバから取り外します.
        #
        # @return [Disk]
        def disconnect
          @_client.request('DELETE', '/disk/' + _id + '/to/server')
          return self
        end

        # *
        #
        # @return [DiskConfig]
        def create_config
          return Saclient::Cloud::Resource::DiskConfig.new(@_client, _id)
        end

        # コピー中のディスクが利用可能になるまで待機します.
        #
        # @yield [Saclient::Cloud::Resource::Disk, bool]
        # @yieldreturn [void]
        # @param [Fixnum] timeoutSec
        # @return [void]
        def after_copy(timeoutSec, &callback)
          Saclient::Util::validate_type(timeoutSec, 'Fixnum')
          Saclient::Util::validate_type(callback, 'Proc')
          ret = sleep_while_copying(timeoutSec)
          callback.call(self, ret)
        end

        # コピー中のディスクが利用可能になるまで待機します.
        #
        # @param [Fixnum] timeoutSec
        # @return [bool]
        def sleep_while_copying(timeoutSec = 3600)
          Saclient::Util::validate_type(timeoutSec, 'Fixnum')
          step = 3
          while 0 < timeoutSec do
            reload
            a = get_availability
            return true if a == Saclient::Cloud::Enums::EAvailability::available
            timeoutSec = 0 if a != Saclient::Cloud::Enums::EAvailability::migrating
            timeoutSec -= step
            sleep step if 0 < timeoutSec
          end
          return false
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

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_name(v)
          Saclient::Util::validate_type(v, 'String')
          @m_name = v
          @n_name = true
          return @m_name
        end

        public

        # 名前
        #
        # @return [String]
        attr_accessor :name

        def name
          get_name
        end

        def name=(v)
          set_name(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_description

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_description
          return @m_description
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_description(v)
          Saclient::Util::validate_type(v, 'String')
          @m_description = v
          @n_description = true
          return @m_description
        end

        public

        # 説明
        #
        # @return [String]
        attr_accessor :description

        def description
          get_description
        end

        def description=(v)
          set_description(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_tags

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Array<String>]
        def get_tags
          return @m_tags
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Array<String>] v
        # @return [Array<String>]
        def set_tags(v)
          Saclient::Util::validate_type(v, 'Array')
          @m_tags = v
          @n_tags = true
          return @m_tags
        end

        public

        # タグ
        #
        # @return [Array<String>]
        attr_accessor :tags

        def tags
          get_tags
        end

        def tags=(v)
          set_tags(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_icon

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Icon]
        def get_icon
          return @m_icon
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Icon] v
        # @return [Icon]
        def set_icon(v)
          Saclient::Util::validate_type(v, 'Saclient::Cloud::Resource::Icon')
          @m_icon = v
          @n_icon = true
          return @m_icon
        end

        public

        # アイコン
        #
        # @return [Icon]
        attr_accessor :icon

        def icon
          get_icon
        end

        def icon=(v)
          set_icon(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_size_mib

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Fixnum]
        def get_size_mib
          return @m_size_mib
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_size_mib(v)
          Saclient::Util::validate_type(v, 'Fixnum')
          raise Saclient::Errors::SaclientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saclient::Cloud::Resource::Disk#size_mib') if !@is_new
          @m_size_mib = v
          @n_size_mib = true
          return @m_size_mib
        end

        public

        # サイズ[MiB]
        #
        # @return [Fixnum]
        attr_accessor :size_mib

        def size_mib
          get_size_mib
        end

        def size_mib=(v)
          set_size_mib(v)
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

        # @return [bool]
        attr_accessor :n_plan

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [DiskPlan]
        def get_plan
          return @m_plan
        end

        public

        # プラン
        #
        # @return [DiskPlan]
        attr_reader :plan

        def plan
          get_plan
        end

        protected

        # @return [bool]
        attr_accessor :n_server

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Server]
        def get_server
          return @m_server
        end

        public

        # 接続先のサーバ
        #
        # @return [Server]
        attr_reader :server

        def server
          get_server
        end

        protected

        # @return [bool]
        attr_accessor :n_availability

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_availability
          return @m_availability
        end

        public

        # 有効状態
        #
        # @return [String]
        attr_reader :availability

        def availability
          get_availability
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
          if Saclient::Util::exists_path(r, 'Description')
            @m_description = (Saclient::Util::get_by_path(r, 'Description')).nil? ? nil : Saclient::Util::get_by_path(r, 'Description').to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if Saclient::Util::exists_path(r, 'Tags')
            if (Saclient::Util::get_by_path(r, 'Tags')).nil?
              @m_tags = []
            else
              @m_tags = []
              for t in Saclient::Util::get_by_path(r, 'Tags')
                v1 = nil
                v1 = (t).nil? ? nil : t.to_s
                @m_tags << v1
              end
            end
          else
            @m_tags = nil
            @is_incomplete = true
          end
          @n_tags = false
          if Saclient::Util::exists_path(r, 'Icon')
            @m_icon = (Saclient::Util::get_by_path(r, 'Icon')).nil? ? nil : Saclient::Cloud::Resource::Icon.new(@_client, Saclient::Util::get_by_path(r, 'Icon'))
          else
            @m_icon = nil
            @is_incomplete = true
          end
          @n_icon = false
          if Saclient::Util::exists_path(r, 'SizeMB')
            @m_size_mib = (Saclient::Util::get_by_path(r, 'SizeMB')).nil? ? nil : (Saclient::Util::get_by_path(r, 'SizeMB').to_s).to_i(10)
          else
            @m_size_mib = nil
            @is_incomplete = true
          end
          @n_size_mib = false
          if Saclient::Util::exists_path(r, 'ServiceClass')
            @m_service_class = (Saclient::Util::get_by_path(r, 'ServiceClass')).nil? ? nil : Saclient::Util::get_by_path(r, 'ServiceClass').to_s
          else
            @m_service_class = nil
            @is_incomplete = true
          end
          @n_service_class = false
          if Saclient::Util::exists_path(r, 'Plan')
            @m_plan = (Saclient::Util::get_by_path(r, 'Plan')).nil? ? nil : Saclient::Cloud::Resource::DiskPlan.new(@_client, Saclient::Util::get_by_path(r, 'Plan'))
          else
            @m_plan = nil
            @is_incomplete = true
          end
          @n_plan = false
          if Saclient::Util::exists_path(r, 'Server')
            @m_server = (Saclient::Util::get_by_path(r, 'Server')).nil? ? nil : Saclient::Cloud::Resource::Server.new(@_client, Saclient::Util::get_by_path(r, 'Server'))
          else
            @m_server = nil
            @is_incomplete = true
          end
          @n_server = false
          if Saclient::Util::exists_path(r, 'Availability')
            @m_availability = (Saclient::Util::get_by_path(r, 'Availability')).nil? ? nil : Saclient::Util::get_by_path(r, 'Availability').to_s
          else
            @m_availability = nil
            @is_incomplete = true
          end
          @n_availability = false
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
          Saclient::Util::set_by_path(ret, 'Description', @m_description) if withClean || @n_description
          if withClean || @n_tags
            Saclient::Util::set_by_path(ret, 'Tags', [])
            for r1 in @m_tags
              v = nil
              v = r1
              ret[:Tags] << v
            end
          end
          Saclient::Util::set_by_path(ret, 'Icon', withClean ? ((@m_icon).nil? ? nil : @m_icon.api_serialize(withClean)) : ((@m_icon).nil? ? { ID: '0' } : @m_icon.api_serialize_id)) if withClean || @n_icon
          Saclient::Util::set_by_path(ret, 'SizeMB', @m_size_mib) if withClean || @n_size_mib
          Saclient::Util::set_by_path(ret, 'ServiceClass', @m_service_class) if withClean || @n_service_class
          Saclient::Util::set_by_path(ret, 'Plan', withClean ? ((@m_plan).nil? ? nil : @m_plan.api_serialize(withClean)) : ((@m_plan).nil? ? { ID: '0' } : @m_plan.api_serialize_id)) if withClean || @n_plan
          Saclient::Util::set_by_path(ret, 'Server', withClean ? ((@m_server).nil? ? nil : @m_server.api_serialize(withClean)) : ((@m_server).nil? ? { ID: '0' } : @m_server.api_serialize_id)) if withClean || @n_server
          Saclient::Util::set_by_path(ret, 'Availability', @m_availability) if withClean || @n_availability
          return ret
        end

      end

    end
  end
end
