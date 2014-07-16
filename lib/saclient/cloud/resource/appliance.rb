# -*- encoding: UTF-8 -*-

require_relative '../client'
require_relative 'resource'
require_relative 'icon'
require_relative 'iface'
require_relative '../enums/eappliance_class'

module Saclient
  module Cloud
    module Resource

      # アプライアンスのリソース情報へのアクセス機能や操作機能を備えたクラス.
      class Appliance < Saclient::Cloud::Resource::Resource

        protected

        # ID
        #
        # @return [String]
        attr_accessor :m_id

        # クラス
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
        # @return [Array<Iface>]
        attr_accessor :m_ifaces

        # サービスクラス
        #
        # @return [String]
        attr_accessor :m_service_class

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
        def _id
          return get_id
        end

        # このローカルオブジェクトに現在設定されているリソース情報をAPIに送信し, 上書き保存します.
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
        # @param [Saclient::Cloud::Client] client
        # @param [any] r
        def initialize(client, r)
          super(client)
          api_deserialize(r)
        end

        # アプライアンスを起動します.
        #
        # @return [Appliance]
        def boot
          @_client.request('PUT', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/power')
          return self
        end

        # アプライアンスをシャットダウンします.
        #
        # @return [Appliance]
        def shutdown
          @_client.request('DELETE', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/power')
          return self
        end

        # アプライアンスを強制停止します.
        #
        # @return [Appliance]
        def stop
          @_client.request('DELETE', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/power', { Force: true })
          return self
        end

        # アプライアンスを強制再起動します.
        #
        # @return [Appliance]
        def reboot
          @_client.request('PUT', _api_path + '/' + Saclient::Cloud::Util::url_encode(_id) + '/reset')
          return self
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
        attr_accessor :n_clazz

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [String]
        def get_clazz
          return @m_clazz
        end

        # (This method is generated in Translator_default#buildImpl)
        #
        # @param [String] v
        # @return [String]
        def set_clazz(v)
          @m_clazz = v
          @n_clazz = true
          return @m_clazz
        end

        public

        # クラス
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
        attr_accessor :n_ifaces

        # (This method is generated in Translator_default#buildImpl)
        #
        # @return [Array<Iface>]
        def get_ifaces
          return @m_ifaces
        end

        public

        # プラン
        #
        # @return [Array<Iface>]
        attr_reader :ifaces

        def ifaces
          get_ifaces
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
          if !r.nil? && r.key?(:ID)
            @m_id = (r[:ID]).nil? ? nil : r[:ID].to_s
          else
            @m_id = nil
            @is_incomplete = true
          end
          @n_id = false
          if !r.nil? && r.key?(:Class)
            @m_clazz = (r[:Class]).nil? ? nil : r[:Class].to_s
          else
            @m_clazz = nil
            @is_incomplete = true
          end
          @n_clazz = false
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
          if !r.nil? && r.key?(:ServiceClass)
            @m_service_class = (r[:ServiceClass]).nil? ? nil : r[:ServiceClass].to_s
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
          ret = {}
          ret[:ID] = @m_id if withClean || @n_id
          ret[:Class] = @m_clazz if withClean || @n_clazz
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
          if withClean || @n_ifaces
            ret[:Interfaces] = []
            for r in @m_ifaces
              v = nil
              v = withClean ? ((r).nil? ? nil : r.api_serialize(withClean)) : ((r).nil? ? { ID: '0' } : r.api_serialize_id)
              ret[:Interfaces] << v
            end
          end
          ret[:ServiceClass] = @m_service_class if withClean || @n_service_class
          return ret
        end

      end

    end
  end
end
