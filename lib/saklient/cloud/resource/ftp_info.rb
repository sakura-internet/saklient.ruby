# -*- encoding: UTF-8 -*-

require_relative '../../util'

module Saklient
  module Cloud
    module Resource

      # FTPサーバのアカウント情報.
      class FtpInfo

        protected

        # @private
        # @return [String]
        attr_accessor :_host_name

        public

        # @return [String]
        def get_host_name
          return @_host_name
        end

        # ホスト名
        #
        # @return [String]
        attr_reader :host_name

        def host_name
          get_host_name
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_user

        public

        # @return [String]
        def get_user
          return @_user
        end

        # ユーザ名
        #
        # @return [String]
        attr_reader :user

        def user
          get_user
        end

        protected

        # @private
        # @return [String]
        attr_accessor :_password

        public

        # @return [String]
        def get_password
          return @_password
        end

        # パスワード
        #
        # @return [String]
        attr_reader :password

        def password
          get_password
        end

        # @ignore
        # @param [any] obj
        def initialize(obj)
          @_host_name = obj[:HostName]
          @_user = obj[:User]
          @_password = obj[:Password]
        end

      end

    end
  end
end
