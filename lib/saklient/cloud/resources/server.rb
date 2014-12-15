# -*- encoding: UTF-8 -*-

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'disk'
require_relative 'iface'
require_relative 'server_plan'
require_relative 'server_instance'
require_relative 'iso_image'
require_relative '../enums/eserver_instance_status'
require_relative '../enums/eavailability'
require_relative '../models/model_disk'
require_relative '../models/model_iface'

module Saklient
  module Cloud
    module Resources

      # サーバの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Server < Saklient::Cloud::Resources::Resource

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

        # タグ文字列の配列
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

        # 有効状態 {Saklient::Cloud::Enums::EAvailability}
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
        def _class_name
          return 'Server'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
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
        # @param [Saklient::Cloud::Client] client
        # @param [any] obj
        # @param [bool] wrapped
        def initialize(client, obj, wrapped = false)
          super(client)
          Saklient::Util::validate_type(client, 'Saklient::Cloud::Client')
          Saklient::Util::validate_type(wrapped, 'bool')
          api_deserialize(obj, wrapped)
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
        # @return [Server] this
        def boot
          @_client.request('PUT', _api_path + '/' + Saklient::Util::url_encode(_id) + '/power')
          return reload
        end

        # サーバをシャットダウンします.
        #
        # @return [Server] this
        def shutdown
          @_client.request('DELETE', _api_path + '/' + Saklient::Util::url_encode(_id) + '/power')
          return reload
        end

        # サーバを強制停止します.
        #
        # @return [Server] this
        def stop
          @_client.request('DELETE', _api_path + '/' + Saklient::Util::url_encode(_id) + '/power', { Force: true })
          return reload
        end

        # サーバを強制再起動します.
        #
        # @return [Server] this
        def reboot
          @_client.request('PUT', _api_path + '/' + Saklient::Util::url_encode(_id) + '/reset')
          return reload
        end

        # サーバが起動するまで待機します.
        #
        # @param [Fixnum] timeoutSec
        # @return [bool]
        def sleep_until_up(timeoutSec = 180)
          Saklient::Util::validate_type(timeoutSec, 'Fixnum')
          return sleep_until(Saklient::Cloud::Enums::EServerInstanceStatus::up, timeoutSec)
        end

        # サーバが停止するまで待機します.
        #
        # @param [Fixnum] timeoutSec
        # @return [bool] 成功時はtrue, タイムアウトやエラーによる失敗時はfalseを返します.
        def sleep_until_down(timeoutSec = 180)
          Saklient::Util::validate_type(timeoutSec, 'Fixnum')
          return sleep_until(Saklient::Cloud::Enums::EServerInstanceStatus::down, timeoutSec)
        end

        protected

        # サーバが指定のステータスに遷移するまで待機します.
        #
        # @private
        # @param [String] status
        # @param [Fixnum] timeoutSec
        # @return [bool]
        def sleep_until(status, timeoutSec = 180)
          Saklient::Util::validate_type(status, 'String')
          Saklient::Util::validate_type(timeoutSec, 'Fixnum')
          step = 10
          while 0 < timeoutSec do
            reload
            s = nil
            inst = self.instance
            s = inst.status if !(inst).nil?
            s = Saklient::Cloud::Enums::EServerInstanceStatus::down if (s).nil?
            return true if s == status
            timeoutSec -= step
            sleep(step) if 0 < timeoutSec
          end
          return false
        end

        public

        # サーバプランを変更します.
        #
        # 成功時はリソースIDが変わることにご注意ください.
        #
        # @param [ServerPlan] planTo
        # @return [Server] this
        def change_plan(planTo)
          Saklient::Util::validate_type(planTo, 'Saklient::Cloud::Resources::ServerPlan')
          path = _api_path + '/' + Saklient::Util::url_encode(_id) + '/to/plan/' + Saklient::Util::url_encode(planTo._id)
          result = @_client.request('PUT', path)
          api_deserialize(result, true)
          return self
        end

        # サーバに接続されているディスクのリストを取得します.
        #
        # @return [Array<Disk>]
        def find_disks
          model = Saklient::Util::create_class_instance('saklient.cloud.models.Model_Disk', [@_client])
          return model.with_server_id(_id).find
        end

        # サーバにインタフェースを1つ増設し, それを取得します.
        #
        # @return [Iface] 増設されたインタフェース
        def add_iface
          model = Saklient::Util::create_class_instance('saklient.cloud.models.Model_Iface', [@_client])
          res = model.create
          res.server_id = _id
          return res.save
        end

        # サーバにISOイメージを挿入します.
        #
        # @param [IsoImage] iso
        # @return [Server] this
        def insert_iso_image(iso)
          Saklient::Util::validate_type(iso, 'Saklient::Cloud::Resources::IsoImage')
          path = _api_path + '/' + Saklient::Util::url_encode(_id) + '/cdrom'
          q = { CDROM: { ID: iso._id } }
          @_client.request('PUT', path, q)
          reload
          return self
        end

        # サーバに挿入されているISOイメージを排出します.
        #
        # @return [Server] this
        def eject_iso_image
          path = _api_path + '/' + Saklient::Util::url_encode(_id) + '/cdrom'
          @_client.request('DELETE', path)
          reload
          return self
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

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_name(v)
          Saklient::Util::validate_type(v, 'String')
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
        # @private
        # @return [String]
        def get_description
          return @m_description
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_description(v)
          Saklient::Util::validate_type(v, 'String')
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
        # @private
        # @return [Array<String>]
        def get_tags
          @n_tags = true
          return @m_tags
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [Array<String>] v
        # @return [Array<String>]
        def set_tags(v)
          Saklient::Util::validate_type(v, 'Array')
          @m_tags = v
          @n_tags = true
          return @m_tags
        end

        public

        # タグ文字列の配列
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
        # @private
        # @return [Icon]
        def get_icon
          return @m_icon
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [Icon] v
        # @return [Icon]
        def set_icon(v)
          Saklient::Util::validate_type(v, 'Saklient::Cloud::Resources::Icon')
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
        # @private
        # @return [ServerPlan]
        def get_plan
          return @m_plan
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [ServerPlan] v
        # @return [ServerPlan]
        def set_plan(v)
          Saklient::Util::validate_type(v, 'Saklient::Cloud::Resources::ServerPlan')
          raise Saklient::Errors::SaklientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saklient::Cloud::Resources::Server#plan') if !@is_new
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
        # @private
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
        # @private
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
        # @private
        # @return [String]
        def get_availability
          return @m_availability
        end

        public

        # 有効状態 {Saklient::Cloud::Enums::EAvailability}
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
          if Saklient::Util::exists_path(r, 'Description')
            @m_description = (Saklient::Util::get_by_path(r, 'Description')).nil? ? nil : Saklient::Util::get_by_path(r, 'Description').to_s
          else
            @m_description = nil
            @is_incomplete = true
          end
          @n_description = false
          if Saklient::Util::exists_path(r, 'Tags')
            if (Saklient::Util::get_by_path(r, 'Tags')).nil?
              @m_tags = []
            else
              @m_tags = []
              for t in Saklient::Util::get_by_path(r, 'Tags')
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
          if Saklient::Util::exists_path(r, 'Icon')
            @m_icon = (Saklient::Util::get_by_path(r, 'Icon')).nil? ? nil : Saklient::Cloud::Resources::Icon.new(@_client, Saklient::Util::get_by_path(r, 'Icon'))
          else
            @m_icon = nil
            @is_incomplete = true
          end
          @n_icon = false
          if Saklient::Util::exists_path(r, 'ServerPlan')
            @m_plan = (Saklient::Util::get_by_path(r, 'ServerPlan')).nil? ? nil : Saklient::Cloud::Resources::ServerPlan.new(@_client, Saklient::Util::get_by_path(r, 'ServerPlan'))
          else
            @m_plan = nil
            @is_incomplete = true
          end
          @n_plan = false
          if Saklient::Util::exists_path(r, 'Interfaces')
            if (Saklient::Util::get_by_path(r, 'Interfaces')).nil?
              @m_ifaces = []
            else
              @m_ifaces = []
              for t in Saklient::Util::get_by_path(r, 'Interfaces')
                v2 = nil
                v2 = (t).nil? ? nil : Saklient::Cloud::Resources::Iface.new(@_client, t)
                @m_ifaces << v2
              end
            end
          else
            @m_ifaces = nil
            @is_incomplete = true
          end
          @n_ifaces = false
          if Saklient::Util::exists_path(r, 'Instance')
            @m_instance = (Saklient::Util::get_by_path(r, 'Instance')).nil? ? nil : Saklient::Cloud::Resources::ServerInstance.new(@_client, Saklient::Util::get_by_path(r, 'Instance'))
          else
            @m_instance = nil
            @is_incomplete = true
          end
          @n_instance = false
          if Saklient::Util::exists_path(r, 'Availability')
            @m_availability = (Saklient::Util::get_by_path(r, 'Availability')).nil? ? nil : Saklient::Util::get_by_path(r, 'Availability').to_s
          else
            @m_availability = nil
            @is_incomplete = true
          end
          @n_availability = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          missing = []
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          if withClean || @n_name
            Saklient::Util::set_by_path(ret, 'Name', @m_name)
          else
            missing << 'name' if @is_new
          end
          Saklient::Util::set_by_path(ret, 'Description', @m_description) if withClean || @n_description
          if withClean || @n_tags
            Saklient::Util::set_by_path(ret, 'Tags', [])
            for r1 in @m_tags
              v = nil
              v = r1
              ret[:Tags] << v
            end
          end
          Saklient::Util::set_by_path(ret, 'Icon', withClean ? ((@m_icon).nil? ? nil : @m_icon.api_serialize(withClean)) : ((@m_icon).nil? ? { ID: '0' } : @m_icon.api_serialize_id)) if withClean || @n_icon
          if withClean || @n_plan
            Saklient::Util::set_by_path(ret, 'ServerPlan', withClean ? ((@m_plan).nil? ? nil : @m_plan.api_serialize(withClean)) : ((@m_plan).nil? ? { ID: '0' } : @m_plan.api_serialize_id))
          else
            missing << 'plan' if @is_new
          end
          if withClean || @n_ifaces
            Saklient::Util::set_by_path(ret, 'Interfaces', [])
            for r2 in @m_ifaces
              v = nil
              v = withClean ? ((r2).nil? ? nil : r2.api_serialize(withClean)) : ((r2).nil? ? { ID: '0' } : r2.api_serialize_id)
              ret[:Interfaces] << v
            end
          end
          Saklient::Util::set_by_path(ret, 'Instance', withClean ? ((@m_instance).nil? ? nil : @m_instance.api_serialize(withClean)) : ((@m_instance).nil? ? { ID: '0' } : @m_instance.api_serialize_id)) if withClean || @n_instance
          Saklient::Util::set_by_path(ret, 'Availability', @m_availability) if withClean || @n_availability
          raise Saklient::Errors::SaklientException.new('required_field', 'Required fields must be set before the Server creation: ' + missing.join(', ')) if missing.length > 0
          return ret
        end

      end

    end
  end
end
