# -*- encoding: UTF-8 -*-

require_relative '../client.rb'
require_relative 'resource.rb'
require_relative 'icon.rb'
require_relative 'disk.rb'
require_relative 'iface.rb'
require_relative 'server_plan.rb'
require_relative 'server_instance.rb'
require_relative '../enums/eserver_instance_status.rb'

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

        # @private
        # @return [String]
        def _api_path
          '/server'
        end

        # @private
        # @return [String]
        def _root_key
          'Server'
        end

        # @private
        # @return [String]
        def _root_key_m
          'Servers'
        end

        public

        # @private
        # @return [String]
        def _id
          get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 新しいインスタンスを作成します.
        #
        # @return [Server] this
        def create
          _create
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
        #
        # @return [Server] this
        def save
          _save
        end

        # 最新のリソース情報を再取得します.
        #
        # @return [Server] this
        def reload
          _reload
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
          !(@instance[:status]).nil? && Saclient::Cloud::Enums::EServerInstanceStatus.compare(@instance[:status], Saclient::Cloud::Enums::EServerInstanceStatus[:up]) == 0
        end

        # サーバを起動します.
        #
        # @return [Server]
        def boot
          @_client.request('PUT', _api_path + '/' + Saclient::Cloud::Util.url_encode(_id) + '/power')
          self
        end

        # サーバをシャットダウンします.
        #
        # @return [Server]
        def shutdown
          @_client.request('DELETE', _api_path + '/' + Saclient::Cloud::Util.url_encode(_id) + '/power')
          self
        end

        # サーバを強制停止します.
        #
        # @return [Server]
        def stop
          @_client.request('DELETE', _api_path + '/' + Saclient::Cloud::Util.url_encode(_id) + '/power', { Force: true })
          self
        end

        # サーバを強制再起動します.
        #
        # @return [Server]
        def reboot
          @_client.request('PUT', _api_path + '/' + Saclient::Cloud::Util.url_encode(_id) + '/reset')
          self
        end

        # サーバのプランを変更します.
        #
        # @param [ServerPlan] planTo
        # @return [Server]
        def change_plan(planTo)
          path = _api_path + '/' + Saclient::Cloud::Util.url_encode(_id) + '/to/plan/' + Saclient::Cloud::Util.url_encode(planTo._id)
          result = @_client.request('PUT', path)
          api_deserialize(result[_root_key.to_sym])
          self
        end

        # サーバに接続されているディスクのリストを取得します.
        #
        # @return [Array<Disk>]
        def find_disks
          model = Saclient::Cloud::Util.create_class_instance('saclient.cloud.model.Model_Disk', [@_client])
          model.with_server_id(_id).find
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
          @m_name
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_name(v)
          @m_name = v
          @n_name = true
          @m_name
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
          @m_description
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_description(v)
          @m_description = v
          @n_description = true
          @m_description
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
          @m_tags
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Array<String>] v
        # @return [Array<String>]
        def set_tags(v)
          @m_tags = v
          @n_tags = true
          @m_tags
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
          @m_icon
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [Icon] v
        # @return [Icon]
        def set_icon(v)
          @m_icon = v
          @n_icon = true
          @m_icon
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
          @m_plan
        end

        public

        # プラン
        #
        # @return [ServerPlan]
        attr_reader :plan

        def plan
          get_plan
        end

        protected

        # @return [bool]
        attr_accessor :n_ifaces

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Array<Iface>]
        def get_ifaces
          @m_ifaces
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
          @m_instance
        end

        public

        # インスタンス情報
        #
        # @return [ServerInstance]
        attr_reader :instance

        def instance
          get_instance
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [any] r
        def api_deserialize(r)
          @is_incomplete = true
          if !r.nil? && r.key?(:ID)
            @m_id = (r[:ID]).nil? ? nil : r[:ID].to_s
            @n_id = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:Name)
            @m_name = (r[:Name]).nil? ? nil : r[:Name].to_s
            @n_name = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:Description)
            @m_description = (r[:Description]).nil? ? nil : r[:Description].to_s
            @n_description = false
          else
            @is_incomplete = false
          end
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
            @n_tags = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:Icon)
            @m_icon = (r[:Icon]).nil? ? nil : Saclient::Cloud::Resource::Icon.new(@_client, r[:Icon])
            @n_icon = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:ServerPlan)
            @m_plan = (r[:ServerPlan]).nil? ? nil : Saclient::Cloud::Resource::ServerPlan.new(@_client, r[:ServerPlan])
            @n_plan = false
          else
            @is_incomplete = false
          end
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
            @n_ifaces = false
          else
            @is_incomplete = false
          end
          if !r.nil? && r.key?(:Instance)
            @m_instance = (r[:Instance]).nil? ? nil : Saclient::Cloud::Resource::ServerInstance.new(@_client, r[:Instance])
            @n_instance = false
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
          ret
        end

      end

    end
  end
end
