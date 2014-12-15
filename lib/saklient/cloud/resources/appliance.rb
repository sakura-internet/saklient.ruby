# -*- encoding: UTF-8 -*-

require_relative '../../errors/saklient_exception'
require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'iface'
require_relative 'swytch'
require_relative '../enums/eappliance_class'
require_relative '../enums/eavailability'
require_relative '../enums/eserver_instance_status'
require_relative '../models/model_swytch'

module Saklient
  module Cloud
    module Resources

      # アプライアンスの実体1つに対応し, 属性の取得や操作を行うためのクラス.
      class Appliance < Saklient::Cloud::Resources::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # クラス {Saklient::Cloud::Enums::EApplianceClass}
        #
        # @return [String]
        attr_accessor :m_clazz

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
        # @return [Fixnum]
        attr_accessor :m_plan_id

        # インタフェース {Iface} の配列
        #
        # @return [Array<Iface>]
        attr_accessor :m_ifaces

        # 注釈
        #
        # @return [any]
        attr_accessor :m_raw_annotation

        # 設定の生データ
        #
        # @return [any]
        attr_accessor :m_raw_settings

        # @private
        # @return [String]
        attr_accessor :m_raw_settings_hash

        # 起動状態 {Saklient::Cloud::Enums::EServerInstanceStatus}
        #
        # @return [String]
        attr_accessor :m_status

        # サービスクラス
        #
        # @return [String]
        attr_accessor :m_service_class

        # 有効状態 {Saklient::Cloud::Enums::EAvailability}
        #
        # @return [String]
        attr_accessor :m_availability

        # 接続先スイッチID
        #
        # @return [String]
        attr_accessor :m_swytch_id

        # @private
        # @return [String]
        def _api_path
          return '/appliance'
        end

        # @private
        # @return [String]
        def _root_key
          return 'Appliance'
        end

        # @private
        # @return [String]
        def _root_key_m
          return 'Appliances'
        end

        public

        # @private
        # @return [String]
        def _class_name
          return 'Appliance'
        end

        # @private
        # @return [String]
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新規作成または上書き保存します.
        #
        # @return [Appliance] this
        def save
          return _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Appliance] this
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

        protected

        # @private
        # @param [any] query
        # @return [void]
        def _on_before_save(query)
          Saklient::Util::set_by_path(query, 'OriginalSettingsHash', get_raw_settings_hash)
        end

        public

        # このルータが接続されているスイッチを取得します.
        #
        # @return [Swytch]
        def get_swytch
          model = Saklient::Util::create_class_instance('saklient.cloud.models.Model_Swytch', [@_client])
          id = get_swytch_id
          return model.get_by_id(id)
        end

        # アプライアンスの設定を反映します.
        #
        # @return [Appliance] this
        def apply
          @_client.request('PUT', _api_path + '/' + Saklient::Util::url_encode(_id) + '/config')
          return self
        end

        # アプライアンスを起動します.
        #
        # @return [Appliance] this
        def boot
          @_client.request('PUT', _api_path + '/' + Saklient::Util::url_encode(_id) + '/power')
          return self
        end

        # アプライアンスをシャットダウンします.
        #
        # @return [Appliance] this
        def shutdown
          @_client.request('DELETE', _api_path + '/' + Saklient::Util::url_encode(_id) + '/power')
          return self
        end

        # アプライアンスを強制停止します.
        #
        # @return [Appliance] this
        def stop
          @_client.request('DELETE', _api_path + '/' + Saklient::Util::url_encode(_id) + '/power', { Force: true })
          return self
        end

        # アプライアンスを強制再起動します.
        #
        # @return [Appliance] this
        def reboot
          @_client.request('PUT', _api_path + '/' + Saklient::Util::url_encode(_id) + '/reset')
          return self
        end

        # 作成中のアプライアンスが利用可能になるまで待機します.
        #
        # @param [Fixnum] timeoutSec
        # @return [bool] 成功時はtrue, タイムアウトやエラーによる失敗時はfalseを返します.
        def sleep_while_creating(timeoutSec = 600)
          Saklient::Util::validate_type(timeoutSec, 'Fixnum')
          step = 10
          while 0 < timeoutSec do
            reload
            a = get_availability
            return true if a == Saklient::Cloud::Enums::EAvailability::available
            timeoutSec = 0 if a != Saklient::Cloud::Enums::EAvailability::migrating
            timeoutSec -= step
            sleep(step) if 0 < timeoutSec
          end
          return false
        end

        # アプライアンスが起動するまで待機します.
        #
        # @param [Fixnum] timeoutSec
        # @return [bool]
        def sleep_until_up(timeoutSec = 600)
          Saklient::Util::validate_type(timeoutSec, 'Fixnum')
          return sleep_until(Saklient::Cloud::Enums::EServerInstanceStatus::up, timeoutSec)
        end

        # アプライアンスが停止するまで待機します.
        #
        # @param [Fixnum] timeoutSec
        # @return [bool] 成功時はtrue, タイムアウトやエラーによる失敗時はfalseを返します.
        def sleep_until_down(timeoutSec = 600)
          Saklient::Util::validate_type(timeoutSec, 'Fixnum')
          return sleep_until(Saklient::Cloud::Enums::EServerInstanceStatus::down, timeoutSec)
        end

        protected

        # アプライアンスが指定のステータスに遷移するまで待機します.
        #
        # @private
        # @param [String] status
        # @param [Fixnum] timeoutSec
        # @return [bool]
        def sleep_until(status, timeoutSec = 600)
          Saklient::Util::validate_type(status, 'String')
          Saklient::Util::validate_type(timeoutSec, 'Fixnum')
          step = 10
          while 0 < timeoutSec do
            reload
            s = get_status
            s = Saklient::Cloud::Enums::EServerInstanceStatus::down if (s).nil?
            return true if s == status
            timeoutSec -= step
            sleep(step) if 0 < timeoutSec
          end
          return false
        end

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
        attr_accessor :n_clazz

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_clazz
          return @m_clazz
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [String] v
        # @return [String]
        def set_clazz(v)
          Saklient::Util::validate_type(v, 'String')
          raise Saklient::Errors::SaklientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saklient::Cloud::Resources::Appliance#clazz') if !@is_new
          @m_clazz = v
          @n_clazz = true
          return @m_clazz
        end

        public

        # クラス {Saklient::Cloud::Enums::EApplianceClass}
        #
        # @return [String]
        attr_accessor :clazz

        def clazz
          get_clazz
        end

        def clazz=(v)
          set_clazz(v)
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
        attr_accessor :n_plan_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [Fixnum]
        def get_plan_id
          return @m_plan_id
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [Fixnum] v
        # @return [Fixnum]
        def set_plan_id(v)
          Saklient::Util::validate_type(v, 'Fixnum')
          raise Saklient::Errors::SaklientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saklient::Cloud::Resources::Appliance#plan_id') if !@is_new
          @m_plan_id = v
          @n_plan_id = true
          return @m_plan_id
        end

        public

        # プラン
        #
        # @return [Fixnum]
        attr_accessor :plan_id

        def plan_id
          get_plan_id
        end

        def plan_id=(v)
          set_plan_id(v)
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

        # インタフェース {Iface} の配列
        #
        # @return [Array<Iface>]
        attr_reader :ifaces

        def ifaces
          get_ifaces
        end

        protected

        # @return [bool]
        attr_accessor :n_raw_annotation

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [any]
        def get_raw_annotation
          return @m_raw_annotation
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [any] v
        # @return [any]
        def set_raw_annotation(v)
          raise Saklient::Errors::SaklientException.new('immutable_field', 'Immutable fields cannot be modified after the resource creation: ' + 'Saklient::Cloud::Resources::Appliance#raw_annotation') if !@is_new
          @m_raw_annotation = v
          @n_raw_annotation = true
          return @m_raw_annotation
        end

        public

        # 注釈
        #
        # @return [any]
        attr_accessor :raw_annotation

        def raw_annotation
          get_raw_annotation
        end

        def raw_annotation=(v)
          set_raw_annotation(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_raw_settings

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [any]
        def get_raw_settings
          @n_raw_settings = true
          return @m_raw_settings
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @param [any] v
        # @return [any]
        def set_raw_settings(v)
          @m_raw_settings = v
          @n_raw_settings = true
          return @m_raw_settings
        end

        public

        # 設定の生データ
        #
        # @return [any]
        attr_accessor :raw_settings

        def raw_settings
          get_raw_settings
        end

        def raw_settings=(v)
          set_raw_settings(v)
        end

        protected

        # @return [bool]
        attr_accessor :n_raw_settings_hash

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_raw_settings_hash
          return @m_raw_settings_hash
        end

        public

        # @private
        # @return [String]
        attr_reader :raw_settings_hash

        def raw_settings_hash
          get_raw_settings_hash
        end

        protected

        # @return [bool]
        attr_accessor :n_status

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_status
          return @m_status
        end

        public

        # 起動状態 {Saklient::Cloud::Enums::EServerInstanceStatus}
        #
        # @return [String]
        attr_reader :status

        def status
          get_status
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

        # @return [bool]
        attr_accessor :n_swytch_id

        # (This method is generated in Translator_default#buildImpl)
        #
        # @private
        # @return [String]
        def get_swytch_id
          return @m_swytch_id
        end

        public

        # 接続先スイッチID
        #
        # @return [String]
        attr_reader :swytch_id

        def swytch_id
          get_swytch_id
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
          if Saklient::Util::exists_path(r, 'Class')
            @m_clazz = (Saklient::Util::get_by_path(r, 'Class')).nil? ? nil : Saklient::Util::get_by_path(r, 'Class').to_s
          else
            @m_clazz = nil
            @is_incomplete = true
          end
          @n_clazz = false
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
          if Saklient::Util::exists_path(r, 'Plan.ID')
            @m_plan_id = (Saklient::Util::get_by_path(r, 'Plan.ID')).nil? ? nil : (Saklient::Util::get_by_path(r, 'Plan.ID').to_s).to_s().to_i(10)
          else
            @m_plan_id = nil
            @is_incomplete = true
          end
          @n_plan_id = false
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
          if Saklient::Util::exists_path(r, 'Remark')
            @m_raw_annotation = Saklient::Util::get_by_path(r, 'Remark')
          else
            @m_raw_annotation = nil
            @is_incomplete = true
          end
          @n_raw_annotation = false
          if Saklient::Util::exists_path(r, 'Settings')
            @m_raw_settings = Saklient::Util::get_by_path(r, 'Settings')
          else
            @m_raw_settings = nil
            @is_incomplete = true
          end
          @n_raw_settings = false
          if Saklient::Util::exists_path(r, 'SettingsHash')
            @m_raw_settings_hash = (Saklient::Util::get_by_path(r, 'SettingsHash')).nil? ? nil : Saklient::Util::get_by_path(r, 'SettingsHash').to_s
          else
            @m_raw_settings_hash = nil
            @is_incomplete = true
          end
          @n_raw_settings_hash = false
          if Saklient::Util::exists_path(r, 'Instance.Status')
            @m_status = (Saklient::Util::get_by_path(r, 'Instance.Status')).nil? ? nil : Saklient::Util::get_by_path(r, 'Instance.Status').to_s
          else
            @m_status = nil
            @is_incomplete = true
          end
          @n_status = false
          if Saklient::Util::exists_path(r, 'ServiceClass')
            @m_service_class = (Saklient::Util::get_by_path(r, 'ServiceClass')).nil? ? nil : Saklient::Util::get_by_path(r, 'ServiceClass').to_s
          else
            @m_service_class = nil
            @is_incomplete = true
          end
          @n_service_class = false
          if Saklient::Util::exists_path(r, 'Availability')
            @m_availability = (Saklient::Util::get_by_path(r, 'Availability')).nil? ? nil : Saklient::Util::get_by_path(r, 'Availability').to_s
          else
            @m_availability = nil
            @is_incomplete = true
          end
          @n_availability = false
          if Saklient::Util::exists_path(r, 'Switch.ID')
            @m_swytch_id = (Saklient::Util::get_by_path(r, 'Switch.ID')).nil? ? nil : Saklient::Util::get_by_path(r, 'Switch.ID').to_s
          else
            @m_swytch_id = nil
            @is_incomplete = true
          end
          @n_swytch_id = false
        end

        # @private
        # @param [bool] withClean
        # @return [any]
        def api_serialize_impl(withClean = false)
          Saklient::Util::validate_type(withClean, 'bool')
          missing = []
          ret = {}
          Saklient::Util::set_by_path(ret, 'ID', @m_id) if withClean || @n_id
          if withClean || @n_clazz
            Saklient::Util::set_by_path(ret, 'Class', @m_clazz)
          else
            missing << 'clazz' if @is_new
          end
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
          if withClean || @n_plan_id
            Saklient::Util::set_by_path(ret, 'Plan.ID', @m_plan_id)
          else
            missing << 'plan_id' if @is_new
          end
          if withClean || @n_ifaces
            Saklient::Util::set_by_path(ret, 'Interfaces', [])
            for r2 in @m_ifaces
              v = nil
              v = withClean ? ((r2).nil? ? nil : r2.api_serialize(withClean)) : ((r2).nil? ? { ID: '0' } : r2.api_serialize_id)
              ret[:Interfaces] << v
            end
          end
          if withClean || @n_raw_annotation
            Saklient::Util::set_by_path(ret, 'Remark', @m_raw_annotation)
          else
            missing << 'raw_annotation' if @is_new
          end
          Saklient::Util::set_by_path(ret, 'Settings', @m_raw_settings) if withClean || @n_raw_settings
          Saklient::Util::set_by_path(ret, 'SettingsHash', @m_raw_settings_hash) if withClean || @n_raw_settings_hash
          Saklient::Util::set_by_path(ret, 'Instance.Status', @m_status) if withClean || @n_status
          Saklient::Util::set_by_path(ret, 'ServiceClass', @m_service_class) if withClean || @n_service_class
          Saklient::Util::set_by_path(ret, 'Availability', @m_availability) if withClean || @n_availability
          Saklient::Util::set_by_path(ret, 'Switch.ID', @m_swytch_id) if withClean || @n_swytch_id
          raise Saklient::Errors::SaklientException.new('required_field', 'Required fields must be set before the Appliance creation: ' + missing.join(', ')) if missing.length > 0
          return ret
        end

      end

    end
  end
end
