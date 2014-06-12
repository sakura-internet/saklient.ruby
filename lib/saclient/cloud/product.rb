# -*- encoding: UTF-8 -*-

require_relative 'model/model_server_plan.rb'
require_relative 'model/model_disk_plan.rb'
require_relative 'model/model_internet_plan.rb'
require_relative 'client.rb'

module Saclient
  module Cloud

    class Product

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_ServerPlan]
      attr_accessor :_server

      # @return [Saclient::Cloud::Model::Model_ServerPlan]
      def get_server
        @_server
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
        @_disk
      end

      public

      # @return [Saclient::Cloud::Model::Model_DiskPlan]
      attr_reader :disk

      def disk
        get_disk
      end

      protected

      # @private
      # @return [Saclient::Cloud::Model::Model_InternetPlan]
      attr_accessor :_internet

      # @return [Saclient::Cloud::Model::Model_InternetPlan]
      def get_internet
        @_internet
      end

      public

      # @return [Saclient::Cloud::Model::Model_InternetPlan]
      attr_reader :internet

      def internet
        get_internet
      end

      # @param [Client] client
      def initialize(client)
        @_server = Saclient::Cloud::Model::Model_ServerPlan.new(client)
        @_disk = Saclient::Cloud::Model::Model_DiskPlan.new(client)
        @_internet = Saclient::Cloud::Model::Model_InternetPlan.new(client)
      end

    end

  end
end
