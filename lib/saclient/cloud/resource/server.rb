# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'disk'
require_relative 'iface'
require_relative 'server_plan'
require_relative 'server_instance'
require_relative '../enums/eserver_instance_status'

module Saclient
  module Cloud
    module Resource

      # サーバのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Server < Saclient::Cloud::Resource::Resource

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

        # プラン
        #
        # @return [ServerPlan]
        attr_accessor :m_plan

        # インタフェース
        #
        # @return [Array<Iface>]
        attr_accessor :m_ifaces

        # インスタンス情報
        #
        # @return [ServerInstance]
        attr_accessor :m_instance

        # 有効状態
        #
        # @return [String]
        attr_accessor :m_availability

        # @private
        # @return [String]
        def _api_path
          return '/server'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Server'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Servers'
        end

        public

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Server] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Server] this
        def reload
          return _reload
        end

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
          return get_instance.is_up
        end

        # サーバが停止しているときtrueを返します.
        #
        # @return [bool]
        def is_down
          return get_instance.is_down
        end

        # サーバを起動します.
        #
        # @return [Server]
        def boot
          @_client.request('PUT', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/power')
          return reload
        end

        # サーバをシャットダウンします.
        #
        # @return [Server]
        def shutdown
          @_client.request('DELETE', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/power')
          return reload
        end

        # サーバを強制停止します.
        #
        # @return [Server]
        def stop
          @_client.request('DELETE', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/power', { Force: true })
          return reload
        end

        # サーバを強制再起動します.
        #
        # @return [Server]
        def reboot
          @_client.request('PUT', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/reset')
          return reload
        end

        # サーバが停止するまで待機します.
        #
        # @yield [Saclient::Cloud::Resource::Server, bool]
        # @yieldreturn [void]
        # @param [Integer] timeoutSec
        # @return [void]
        def after_down(timeoutSec, &callback)
          after_status(Saclient::Cloud::Enums::EServerInstanceStatus::down, timeoutSec, &callback)
        end

        protected

        # サーバが指定のステータスに遷移するまで待機します.
        #
        # @ignore
        # @yield [Saclient::Cloud::Resource::Server, bool]
        # @yieldreturn [void]
        # @param [Integer] timeoutSec
        # @param [String] status
        # @return [void]
        def after_status(status, timeoutSec, &callback)
          ret = sleep_until(status, timeoutSec)
          callback.call(self, ret)
        end

        public

        # サーバが停止するまで待機します.
        #
        # @param [Integer] timeoutSec
        # @return [bool]
        def sleep_until_down(timeoutSec = 180)
          return sleep_until(Saclient::Cloud::Enums::EServerInstanceStatus::down, timeoutSec)
        end

        protected

        # サーバが指定のステータスに遷移するまで待機します.
        #
        # @ignore
        # @param [Integer] timeoutSec
        # @param [String] status
        # @return [bool]
        def sleep_until(status, timeoutSec = 180)
          step = 3
          while 0 < timeoutSec do
            reload
            s = get_instance.status
            s = Saclient::Cloud::Enums::EServerInstanceStatus::down if (s).nil?
            return true if s == status
            timeoutSec -= step
            sleep step if 0 < timeoutSec
          end
          return false
        end

        public

        # サーバのプランを変更します.
        #
        # @param [ServerPlan] planTo
        # @return [Server]
        def change_plan(planTo)
          path = _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/to/plan/' + Saclient::Cloud::Util::url_encode(planTo._id)
          result = @_client.request('PUT', path)
          api_deserialize(result[_root_key.to_sym])
          return self
        end

        # サーバに接続されているディスクのリストを取得します.
        #
        # @return [Array<Disk>]
        def find_disks
          model = Saclient::Cloud::Util::create_class_instance('saclient.cloud.model.Model_Disk', [@_client])
          return model.with_server_id(_id).find
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
        attr_accessor :n_plan

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [ServerPlan]
        def get_plan
          return @m_plan
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [ServerPlan] v
        # @return [ServerPlan]
        def set_plan(v)
          @m_plan = v
          @n_plan = true
          return @m_plan
        end

        public

        # プラン
        #
        # @return [ServerPlan]
        attr_accessor :plan

        def plan
          get_plan
        end

        def plan=(v)
          set_plan(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_ifaces

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Array<Iface>]
        def get_ifaces
          return @m_ifaces
        end

        public

        # インタフェース
        #
        # @return [Array<Iface>]
        attr_reader :ifaces

        def ifaces
          get_ifaces
        end

        protected

        # @return [bool]
        attr_accessor :n_instance

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [ServerInstance]
        def get_instance
          return @m_instance
        end

        public

        # インスタンス情報
        #
        # @return [ServerInstance]
        attr_reader :instance

        def instance
          get_instance
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
          if !r.nil? && r.key?(:Description)
            @m_description = (r[:Description]).nil? ? nil : r[:Description].to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if !r.nil? && r.key?(:Tags)
            if (r[:Tags]).nil?
              @m_tags = []
            else
              @m_tags = []
              for t in r[:Tags]
                v = nil
                v = (t).nil? ? nil : t.to_s
                @m_tags << v
              end
            end
          else
            @m_tags = nil
            @is_incomplete = true
          end
          @n_tags = false
          if !r.nil? && r.key?(:Icon)
            @m_icon = (r[:Icon]).nil? ? nil : Saclient::Cloud::Resource::Icon.new(@_client, r[:Icon])
          else
            @m_icon = nil
            @is_incomplete = true
          end
          @n_icon = false
          if !r.nil? && r.key?(:ServerPlan)
            @m_plan = (r[:ServerPlan]).nil? ? nil : Saclient::Cloud::Resource::ServerPlan.new(@_client, r[:ServerPlan])
          else
            @m_plan = nil
            @is_incomplete = true
          end
          @n_plan = false
          if !r.nil? && r.key?(:Interfaces)
            if (r[:Interfaces]).nil?
              @m_ifaces = []
            else
              @m_ifaces = []
              for t in r[:Interfaces]
                v = nil
                v = (t).nil? ? nil : Saclient::Cloud::Resource::Iface.new(@_client, t)
                @m_ifaces << v
              end
            end
          else
            @m_ifaces = nil
            @is_incomplete = true
          end
          @n_ifaces = false
          if !r.nil? && r.key?(:Instance)
            @m_instance = (r[:Instance]).nil? ? nil : Saclient::Cloud::Resource::ServerInstance.new(@_client, r[:Instance])
          else
            @m_instance = nil
            @is_incomplete = true
          end
          @n_instance = false
          if !r.nil? && r.key?(:Availability)
            @m_availability = (r[:Availability]).nil? ? nil : r[:Availability].to_s
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
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:Name] = @m_name if withClean || @n_name
          ret[:Description] = @m_description if withClean || @n_description
          if withClean || @n_tags
            ret[:Tags] = []
            for r in @m_tags
              v = nil
              v = r
              ret[:Tags] << v
            end
          end
          ret[:Icon] = withClean ? ((@m_icon).nil? ? nil : @m_icon.api_serialize(withClean)) : ((@m_icon).nil? ? { ID: '0' } : @m_icon.api_serialize_id) if withClean || @n_icon
          ret[:ServerPlan] = withClean ? ((@m_plan).nil? ? nil : @m_plan.api_serialize(withClean)) : ((@m_plan).nil? ? { ID: '0' } : @m_plan.api_serialize_id) if withClean || @n_plan
          if withClean || @n_ifaces
            ret[:Interfaces] = []
            for r in @m_ifaces
              v = nil
              v = withClean ? ((r).nil? ? nil : r.api_serialize(withClean)) : ((r).nil? ? { ID: '0' } : r.api_serialize_id)
              ret[:Interfaces] << v
            end
          end
          ret[:Instance] = withClean ? ((@m_instance).nil? ? nil : @m_instance.api_serialize(withClean)) : ((@m_instance).nil? ? { ID: '0' } : @m_instance.api_serialize_id) if withClean || @n_instance
          ret[:Availability] = @m_availability if withClean || @n_availability
          return ret
        end

      end

    end
  end
end
