# -*- encoding: UTF-8 -*-
require 'net/https'
require 'json'
require 'uri'
require_relative '../errors/exception_factory'

module Saklient
  module Cloud
    
    # @private
    class Client
      
      def initialize(token, secret)
        @config = {
          api_root: 'https://secure.sakura.ad.jp/cloud/',
          api_root_suffix: nil
        }
        set_access_key token, secret
        self
      end

      def println(msg)
        $stderr.puts msg
      end

      def clone_instance
        instance = self.class.new(@config[:token], @config[:secret])
        instance.set_api_root @config[:api_root]
        instance.set_api_root_suffix @config[:api_root_suffix]

        instance
      end

      def set_api_root(url)
        @config[:api_root] = url
      end

      def set_api_root_suffix(suffix)
        @config[:api_root_suffix] = suffix
      end

      def set_access_key(token, secret)
        @config[:token]  = token
        @config[:secret] = secret
      end

      def request(method, path, params={})
        json = params.to_json

        unless path =~ /^http/
          url_root = @config[:api_root]
          if @config[:api_root_suffix]
            url_root += @config[:api_root_suffix]
            url_root = url_root.sub %r|/?$|, '/'
          end
          url = url_root + 'api/cloud/1.1' + path
        end

        url += '?' + URI.escape(json) if method == 'GET' and !params.nil?

        #println '// APIリクエスト中: #{method} #{path}'

        parsed_url = URI.parse url

        if method == 'GET'
          req = Net::HTTP::Get.new parsed_url
        else
          req = Net::HTTP::Post.new parsed_url
          req.body = json
        end

        req.basic_auth @config[:token], @config[:secret]

        extra_headers = {
          'Content-Type'     => 'application/x-www-form-urlencoded',
          'User-Agent'       => 'saklient.ruby ver-0.0.2.7 rev-3f3b3b7ce4b10e7ebcd77c17497763ba558bf424',
          'X-Requested-With' => 'XMLHttpRequest',
          'X-Sakura-HTTP-Method' => method,
          'X-Sakura-Error-Level' => 'warning',
          'X-Sakura-Request-Format'  => 'json',
          'X-Sakura-Response-Format' => 'json',
          'X-Sakura-No-Authenticate-Header' => '1'
        }

        #println parsed_url

        extra_headers.each do |key, value|
          req[key] = value
        end

        http = Net::HTTP.new parsed_url.host, parsed_url.scheme == 'https' ? 443 : 80
        # http.set_debug_output($stderr) # for debugging
        if parsed_url.scheme == 'https'
          http.use_ssl = true
          # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
        res = http.start {|conn| conn.request req }

        ret = JSON.parse(res.body, {:symbolize_names => true})
        status = res.code.to_i
        unless 200 <= status && status < 300 then
          raise Saklient::Errors::ExceptionFactory.create(status, ret[:error_code], ret[:error_msg])
        end
        
        ret
      end
      
    end
    
  end
end
