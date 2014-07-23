# -*- encoding: UTF-8 -*-

require_relative 'model/model_server_plan'
require_relative 'model/model_disk_plan'
require_relative 'model/model_router_plan'
require_relative 'client'

module Saclient
  module Cloud

    class Product

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_ServerPlan]
      attr_accessor :_server

      # @return [Saclient::Cloud::Model::Model_ServerPlan]
      def get_server
        return @_server
      end

      public

      # @return [Saclient::Cloud::Model::Model_ServerPlan]
      attr_reader :server

      def server
        get_server
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_DiskPlan]
      attr_accessor :_disk

      # @return [Saclient::Cloud::Model::Model_DiskPlan]
      def get_disk
        return @_disk
      end

      public

      # @return [Saclient::Cloud::Model::Model_DiskPlan]
      attr_reader :disk

      def disk
        get_disk
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_RouterPlan]
      attr_accessor :_router

      # @return [Saclient::Cloud::Model::Model_RouterPlan]
      def get_router
        return @_router
      end

      public

      # @return [Saclient::Cloud::Model::Model_RouterPlan]
      attr_reader :router

      def router
        get_router
      end

      # @param [Client] client
      def initialize(client)
        @_server = Saclient::Cloud::Model::Model_ServerPlan.new(client)
        @_disk = Saclient::Cloud::Model::Model_DiskPlan.new(client)
        @_router = Saclient::Cloud::Model::Model_RouterPlan.new(client)
      end

    end

  end
end
