# -*- encoding: UTF-8 -*-

require_relative '../../meta/native_exception.rb'

module Saclient
  module Cloud
    module Errors

      class HttpException < Saclient::Meta::NativeException

        # @return [Integer]
        attr_accessor :status

        # @return [String]
        attr_accessor :code

        # @return [String]
        attr_accessor :message

        # @param [String] message
        # @param [Integer] status
        # @param [String] code
        def initialize(status, code = nil, message = '')
          super(message)
          @status = status
          @code = code
          @message = message
        end

        # @param [String] message
        # @param [Integer] status
        # @param [String] code
        # @return [HttpException]
        def self.create(status, code = nil, message = '')
          switch ((code)) {
          	case { expr => EConst(CString(access_apikey_disabled)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:21: characters 8-32) }:
          do
            AccessApiKeyDisabledException.new(status, code, message)
          end
          	case { expr => EConst(CString(access_sakura)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:22: characters 8-23) }:
          do
            AccessSakuraException.new(status, code, message)
          end
          	case { expr => EConst(CString(access_staff)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:23: characters 8-22) }:
          do
            AccessStaffException.new(status, code, message)
          end
          	case { expr => EConst(CString(access_token)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:24: characters 8-22) }:
          do
            AccessTokenException.new(status, code, message)
          end
          	case { expr => EConst(CString(access_xhr_or_apikey)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:25: characters 8-30) }:
          do
            AccessXhrOrApiKeyException.new(status, code, message)
          end
          	case { expr => EConst(CString(account_not_found)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:26: characters 8-27) }:
          do
            AccountNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CString(account_not_specified)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:27: characters 8-31) }:
          do
            AccountNotSpecifiedException.new(status, code, message)
          end
          	case { expr => EConst(CString(ambiguous_identifier)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:28: characters 8-30) }:
          do
            AmbiguousIdentifierException.new(status, code, message)
          end
          	case { expr => EConst(CString(ambiguous_zone)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:29: characters 8-24) }:
          do
            AmbiguousZoneException.new(status, code, message)
          end
          	case { expr => EConst(CString(apiproxy_timeout)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:30: characters 8-26) }:
          do
            ApiProxyTimeoutException.new(status, code, message)
          end
          	case { expr => EConst(CString(apiproxy_timeout_non_get)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:31: characters 8-34) }:
          do
            ApiProxyTimeoutNonGetException.new(status, code, message)
          end
          	case { expr => EConst(CString(archive_is_incomplete)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:32: characters 8-31) }:
          do
            ArchiveIsIncompleteException.new(status, code, message)
          end
          	case { expr => EConst(CString(bad_gateway)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:33: characters 8-21) }:
          do
            HttpBadGatewayException.new(status, code, message)
          end
          	case { expr => EConst(CString(bad_request)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:34: characters 8-21) }:
          do
            HttpBadRequestException.new(status, code, message)
          end
          	case { expr => EConst(CString(boot_failure_by_lock)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:35: characters 8-30) }:
          do
            BootFailureByLockException.new(status, code, message)
          end
          	case { expr => EConst(CString(boot_failure_in_group)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:36: characters 8-31) }:
          do
            BootFailureInGroupException.new(status, code, message)
          end
          	case { expr => EConst(CString(busy)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:37: characters 8-14) }:
          do
            BusyException.new(status, code, message)
          end
          	case { expr => EConst(CString(cant_resize_smaller)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:38: characters 8-29) }:
          do
            CantResizeSmallerException.new(status, code, message)
          end
          	case { expr => EConst(CString(cdrom_device_locked)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:39: characters 8-29) }:
          do
            CdromDeviceLockedException.new(status, code, message)
          end
          	case { expr => EConst(CString(cdrom_disabled)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:40: characters 8-24) }:
          do
            CdromDisabledException.new(status, code, message)
          end
          	case { expr => EConst(CString(cdrom_in_use)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:41: characters 8-22) }:
          do
            CdromInUseException.new(status, code, message)
          end
          	case { expr => EConst(CString(cdrom_is_incomplete)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:42: characters 8-29) }:
          do
            CdromIsIncompleteException.new(status, code, message)
          end
          	case { expr => EConst(CString(conflict)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:43: characters 8-18) }:
          do
            HttpConflictException.new(status, code, message)
          end
          	case { expr => EConst(CString(connect_to_same_switch)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:44: characters 8-32) }:
          do
            ConnectToSameSwitchException.new(status, code, message)
          end
          	case { expr => EConst(CString(contract_creation)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:45: characters 8-27) }:
          do
            ContractCreationException.new(status, code, message)
          end
          	case { expr => EConst(CString(copy_to_itself)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:46: characters 8-24) }:
          do
            CopyToItselfException.new(status, code, message)
          end
          	case { expr => EConst(CString(delete_disk_b4_template)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:47: characters 8-33) }:
          do
            DeleteDiskB4TemplateException.new(status, code, message)
          end
          	case { expr => EConst(CString(delete_ipv6nets_first)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:48: characters 8-31) }:
          do
            DeleteIpV6NetsFirstException.new(status, code, message)
          end
          	case { expr => EConst(CString(delete_res_b4_account)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:49: characters 8-31) }:
          do
            DeleteResB4AccountException.new(status, code, message)
          end
          	case { expr => EConst(CString(delete_router_b4_switch)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:50: characters 8-33) }:
          do
            DeleteRouterB4SwitchException.new(status, code, message)
          end
          	case { expr => EConst(CString(delete_static_route_first)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:51: characters 8-35) }:
          do
            DeleteStaticRouteFirstException.new(status, code, message)
          end
          	case { expr => EConst(CString(disconnect_b4_delete)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:52: characters 8-30) }:
          do
            DisconnectB4DeleteException.new(status, code, message)
          end
          	case { expr => EConst(CString(disconnect_b4_update)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:53: characters 8-30) }:
          do
            DisconnectB4UpdateException.new(status, code, message)
          end
          	case { expr => EConst(CString(disk_connection_limit)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:54: characters 8-31) }:
          do
            DiskConnectionLimitException.new(status, code, message)
          end
          	case { expr => EConst(CString(disk_is_copying)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:55: characters 8-25) }:
          do
            DiskIsCopyingException.new(status, code, message)
          end
          	case { expr => EConst(CString(disk_is_not_available)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:56: characters 8-31) }:
          do
            DiskIsNotAvailableException.new(status, code, message)
          end
          	case { expr => EConst(CString(disk_license_mismatch)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:57: characters 8-31) }:
          do
            DiskLicenseMismatchException.new(status, code, message)
          end
          	case { expr => EConst(CString(disk_stock_run_out)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:58: characters 8-28) }:
          do
            DiskStockRunOutException.new(status, code, message)
          end
          	case { expr => EConst(CString(diskorss_in_migration)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:59: characters 8-31) }:
          do
            DiskOrSsInMigrationException.new(status, code, message)
          end
          	case { expr => EConst(CString(dns_a_record_not_found)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:60: characters 8-32) }:
          do
            DnsARecordNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CString(dns_aaaa_record_not_found)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:61: characters 8-35) }:
          do
            DnsAaaaRecordNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CString(dns_ptr_update_failure)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:62: characters 8-32) }:
          do
            DnsPtrUpdateFailureException.new(status, code, message)
          end
          	case { expr => EConst(CString(duplicate_account_code)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:63: characters 8-32) }:
          do
            DuplicateAccountCodeException.new(status, code, message)
          end
          	case { expr => EConst(CString(duplicate_entry)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:64: characters 8-25) }:
          do
            DuplicateEntryException.new(status, code, message)
          end
          	case { expr => EConst(CString(duplicate_user_code)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:65: characters 8-29) }:
          do
            DuplicateUserCodeException.new(status, code, message)
          end
          	case { expr => EConst(CString(expectation_failed)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:66: characters 8-28) }:
          do
            HttpExpectationFailedException.new(status, code, message)
          end
          	case { expr => EConst(CString(failed_dependency)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:67: characters 8-27) }:
          do
            HttpFailedDependencyException.new(status, code, message)
          end
          	case { expr => EConst(CString(file_not_uploaded)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:68: characters 8-27) }:
          do
            FileNotUploadedException.new(status, code, message)
          end
          	case { expr => EConst(CString(filter_array_comparison)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:69: characters 8-33) }:
          do
            FilterArrayComparisonException.new(status, code, message)
          end
          	case { expr => EConst(CString(filter_bad_operator)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:70: characters 8-29) }:
          do
            FilterBadOperatorException.new(status, code, message)
          end
          	case { expr => EConst(CString(filter_null_comparison)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:71: characters 8-32) }:
          do
            FilterNullComparisonException.new(status, code, message)
          end
          	case { expr => EConst(CString(filter_unknown_operator)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:72: characters 8-33) }:
          do
            FilterUnknownOperatorException.new(status, code, message)
          end
          	case { expr => EConst(CString(forbidden)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:73: characters 8-19) }:
          do
            HttpForbiddenException.new(status, code, message)
          end
          	case { expr => EConst(CString(ftp_cannot_close)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:74: characters 8-26) }:
          do
            FtpCannotCloseException.new(status, code, message)
          end
          	case { expr => EConst(CString(ftp_is_already_close)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:75: characters 8-30) }:
          do
            FtpIsAlreadyCloseException.new(status, code, message)
          end
          	case { expr => EConst(CString(ftp_is_already_open)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:76: characters 8-29) }:
          do
            FtpIsAlreadyOpenException.new(status, code, message)
          end
          	case { expr => EConst(CString(ftp_must_be_closed)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:77: characters 8-28) }:
          do
            FtpMustBeClosedException.new(status, code, message)
          end
          	case { expr => EConst(CString(gateway_timeout)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:78: characters 8-25) }:
          do
            HttpGatewayTimeoutException.new(status, code, message)
          end
          	case { expr => EConst(CString(gone)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:79: characters 8-14) }:
          do
            HttpGoneException.new(status, code, message)
          end
          	case { expr => EConst(CString(host_operation_failure)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:80: characters 8-32) }:
          do
            HostOperationFailureException.new(status, code, message)
          end
          	case { expr => EConst(CString(http_version_not_supported)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:81: characters 8-36) }:
          do
            HttpHttpVersionNotSupportedException.new(status, code, message)
          end
          	case { expr => EConst(CString(illegal_das_usage)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:82: characters 8-27) }:
          do
            IllegalDasUsageException.new(status, code, message)
          end
          	case { expr => EConst(CString(in_migration)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:83: characters 8-22) }:
          do
            InMigrationException.new(status, code, message)
          end
          	case { expr => EConst(CString(insufficient_storage)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:84: characters 8-30) }:
          do
            HttpInsufficientStorageException.new(status, code, message)
          end
          	case { expr => EConst(CString(internal_server_error)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:85: characters 8-31) }:
          do
            HttpInternalServerErrorException.new(status, code, message)
          end
          	case { expr => EConst(CString(invalid_format)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:86: characters 8-24) }:
          do
            InvalidFormatException.new(status, code, message)
          end
          	case { expr => EConst(CString(invalid_param_comb)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:87: characters 8-28) }:
          do
            InvalidParamCombException.new(status, code, message)
          end
          	case { expr => EConst(CString(invalid_range)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:88: characters 8-23) }:
          do
            InvalidRangeException.new(status, code, message)
          end
          	case { expr => EConst(CString(invalid_uri_argument)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:89: characters 8-30) }:
          do
            InvalidUriArgumentException.new(status, code, message)
          end
          	case { expr => EConst(CString(ipv6net_already_attached)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:90: characters 8-34) }:
          do
            IpV6NetAlreadyAttachedException.new(status, code, message)
          end
          	case { expr => EConst(CString(length_required)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:91: characters 8-25) }:
          do
            HttpLengthRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CString(limit_count_in_account)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:92: characters 8-32) }:
          do
            LimitCountInAccountException.new(status, code, message)
          end
          	case { expr => EConst(CString(limit_count_in_member)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:93: characters 8-31) }:
          do
            LimitCountInMemberException.new(status, code, message)
          end
          	case { expr => EConst(CString(limit_count_in_network)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:94: characters 8-32) }:
          do
            LimitCountInNetworkException.new(status, code, message)
          end
          	case { expr => EConst(CString(limit_count_in_router)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:95: characters 8-31) }:
          do
            LimitCountInRouterException.new(status, code, message)
          end
          	case { expr => EConst(CString(limit_count_in_zone)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:96: characters 8-29) }:
          do
            LimitCountInZoneException.new(status, code, message)
          end
          	case { expr => EConst(CString(limit_memory_in_account)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:97: characters 8-33) }:
          do
            LimitMemoryInAccountException.new(status, code, message)
          end
          	case { expr => EConst(CString(limit_size_in_account)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:98: characters 8-31) }:
          do
            LimitSizeInAccountException.new(status, code, message)
          end
          	case { expr => EConst(CString(locked)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:99: characters 8-16) }:
          do
            HttpLockedException.new(status, code, message)
          end
          	case { expr => EConst(CString(method_not_allowed)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:100: characters 8-28) }:
          do
            HttpMethodNotAllowedException.new(status, code, message)
          end
          	case { expr => EConst(CString(missing_iso_image)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:101: characters 8-27) }:
          do
            MissingIsoImageException.new(status, code, message)
          end
          	case { expr => EConst(CString(missing_param)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:102: characters 8-23) }:
          do
            MissingParamException.new(status, code, message)
          end
          	case { expr => EConst(CString(must_be_of_same_zone)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:103: characters 8-30) }:
          do
            MustBeOfSameZoneException.new(status, code, message)
          end
          	case { expr => EConst(CString(no_display_response)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:104: characters 8-29) }:
          do
            NoDisplayResponseException.new(status, code, message)
          end
          	case { expr => EConst(CString(not_acceptable)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:105: characters 8-24) }:
          do
            HttpNotAcceptableException.new(status, code, message)
          end
          	case { expr => EConst(CString(not_extended)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:106: characters 8-22) }:
          do
            HttpNotExtendedException.new(status, code, message)
          end
          	case { expr => EConst(CString(not_for_router)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:107: characters 8-24) }:
          do
            NotForRouterException.new(status, code, message)
          end
          	case { expr => EConst(CString(not_found)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:108: characters 8-19) }:
          do
            HttpNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CString(not_implemented)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:109: characters 8-25) }:
          do
            HttpNotImplementedException.new(status, code, message)
          end
          	case { expr => EConst(CString(not_replicating)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:110: characters 8-25) }:
          do
            NotReplicatingException.new(status, code, message)
          end
          	case { expr => EConst(CString(not_with_hybridconn)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:111: characters 8-29) }:
          do
            NotWithHybridconnException.new(status, code, message)
          end
          	case { expr => EConst(CString(old_storage_plan)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:112: characters 8-26) }:
          do
            OldStoragePlanException.new(status, code, message)
          end
          	case { expr => EConst(CString(operation_failure)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:113: characters 8-27) }:
          do
            OperationFailureException.new(status, code, message)
          end
          	case { expr => EConst(CString(operation_timeout)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:114: characters 8-27) }:
          do
            OperationTimeoutException.new(status, code, message)
          end
          	case { expr => EConst(CString(original_hash_mismatch)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:115: characters 8-32) }:
          do
            OriginalHashMismatchException.new(status, code, message)
          end
          	case { expr => EConst(CString(packetfilter_applying)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:116: characters 8-31) }:
          do
            PacketFilterApplyingException.new(status, code, message)
          end
          	case { expr => EConst(CString(packetfilter_version_mismatch)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:117: characters 8-39) }:
          do
            PacketFilterVersionMismatchException.new(status, code, message)
          end
          	case { expr => EConst(CString(param_ip_not_found)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:118: characters 8-28) }:
          do
            ParamIpNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CString(param_res_not_found)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:119: characters 8-29) }:
          do
            ParamResNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CString(payment_creditcard)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:120: characters 8-28) }:
          do
            PaymentCreditCardException.new(status, code, message)
          end
          	case { expr => EConst(CString(payment_payment)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:121: characters 8-25) }:
          do
            PaymentPaymentException.new(status, code, message)
          end
          	case { expr => EConst(CString(payment_registration)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:122: characters 8-30) }:
          do
            PaymentRegistrationException.new(status, code, message)
          end
          	case { expr => EConst(CString(payment_required)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:123: characters 8-26) }:
          do
            HttpPaymentRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CString(payment_telcertification)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:124: characters 8-34) }:
          do
            PaymentTelCertificationException.new(status, code, message)
          end
          	case { expr => EConst(CString(payment_unpayable)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:125: characters 8-27) }:
          do
            PaymentUnpayableException.new(status, code, message)
          end
          	case { expr => EConst(CString(penalty_operation)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:126: characters 8-27) }:
          do
            PenaltyOperationException.new(status, code, message)
          end
          	case { expr => EConst(CString(precondition_failed)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:127: characters 8-29) }:
          do
            HttpPreconditionFailedException.new(status, code, message)
          end
          	case { expr => EConst(CString(proxy_authentication_required)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:128: characters 8-39) }:
          do
            HttpProxyAuthenticationRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CString(replica_already_exists)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:129: characters 8-32) }:
          do
            ReplicaAlreadyExistsException.new(status, code, message)
          end
          	case { expr => EConst(CString(replica_not_found)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:130: characters 8-27) }:
          do
            ReplicaNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CString(request_entity_too_large)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:131: characters 8-34) }:
          do
            HttpRequestEntityTooLargeException.new(status, code, message)
          end
          	case { expr => EConst(CString(request_timeout)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:132: characters 8-25) }:
          do
            HttpRequestTimeoutException.new(status, code, message)
          end
          	case { expr => EConst(CString(request_uri_too_long)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:133: characters 8-30) }:
          do
            HttpRequestUriTooLongException.new(status, code, message)
          end
          	case { expr => EConst(CString(requested_range_not_satisfiable)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:134: characters 8-41) }:
          do
            HttpRequestedRangeNotSatisfiableException.new(status, code, message)
          end
          	case { expr => EConst(CString(res_already_connected)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:135: characters 8-31) }:
          do
            ResAlreadyConnectedException.new(status, code, message)
          end
          	case { expr => EConst(CString(res_already_disconnected)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:136: characters 8-34) }:
          do
            ResAlreadyDisconnectedException.new(status, code, message)
          end
          	case { expr => EConst(CString(res_already_exists)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:137: characters 8-28) }:
          do
            ResAlreadyExistsException.new(status, code, message)
          end
          	case { expr => EConst(CString(res_used_in_zone)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:138: characters 8-26) }:
          do
            ResUsedInZoneException.new(status, code, message)
          end
          	case { expr => EConst(CString(resource_path_not_found)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:139: characters 8-33) }:
          do
            ResourcePathNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CString(run_out_of_ipaddress)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:140: characters 8-30) }:
          do
            RunOutOfIpAddressException.new(status, code, message)
          end
          	case { expr => EConst(CString(same_license_required)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:141: characters 8-31) }:
          do
            SameLicenseRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CString(server_could_not_stop)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:142: characters 8-31) }:
          do
            ServerCouldNotStopException.new(status, code, message)
          end
          	case { expr => EConst(CString(server_is_cleaning)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:143: characters 8-28) }:
          do
            ServerIsCleaningException.new(status, code, message)
          end
          	case { expr => EConst(CString(server_operation_failure)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:144: characters 8-34) }:
          do
            ServerOperationFailureException.new(status, code, message)
          end
          	case { expr => EConst(CString(server_power_must_be_down)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:145: characters 8-35) }:
          do
            ServerPowerMustBeDownException.new(status, code, message)
          end
          	case { expr => EConst(CString(server_power_must_be_up)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:146: characters 8-33) }:
          do
            ServerPowerMustBeUpException.new(status, code, message)
          end
          	case { expr => EConst(CString(service_temporarily_unavailable)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:147: characters 8-41) }:
          do
            ServiceTemporarilyUnavailableException.new(status, code, message)
          end
          	case { expr => EConst(CString(service_unavailable)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:148: characters 8-29) }:
          do
            HttpServiceUnavailableException.new(status, code, message)
          end
          	case { expr => EConst(CString(size_mismatch)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:149: characters 8-23) }:
          do
            SizeMismatchException.new(status, code, message)
          end
          	case { expr => EConst(CString(snapshot_in_migration)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:150: characters 8-31) }:
          do
            SnapshotInMigrationException.new(status, code, message)
          end
          	case { expr => EConst(CString(still_creating)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:151: characters 8-24) }:
          do
            StillCreatingException.new(status, code, message)
          end
          	case { expr => EConst(CString(storage_abnormal)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:152: characters 8-26) }:
          do
            StorageAbnormalException.new(status, code, message)
          end
          	case { expr => EConst(CString(storage_operation_failure)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:153: characters 8-35) }:
          do
            StorageOperationFailureException.new(status, code, message)
          end
          	case { expr => EConst(CString(switch_hybrid_connected)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:154: characters 8-33) }:
          do
            SwitchHybridConnectedException.new(status, code, message)
          end
          	case { expr => EConst(CString(template_ftp_is_open)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:155: characters 8-30) }:
          do
            TemplateFtpIsOpenException.new(status, code, message)
          end
          	case { expr => EConst(CString(template_is_incomplete)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:156: characters 8-32) }:
          do
            TemplateIsIncompleteException.new(status, code, message)
          end
          	case { expr => EConst(CString(too_many_request)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:157: characters 8-26) }:
          do
            TooManyRequestException.new(status, code, message)
          end
          	case { expr => EConst(CString(unauthorized)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:158: characters 8-22) }:
          do
            HttpUnauthorizedException.new(status, code, message)
          end
          	case { expr => EConst(CString(unknown)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:159: characters 8-17) }:
          do
            UnknownException.new(status, code, message)
          end
          	case { expr => EConst(CString(unknown_os_type)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:160: characters 8-25) }:
          do
            UnknownOsTypeException.new(status, code, message)
          end
          	case { expr => EConst(CString(unprocessable_entity)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:161: characters 8-30) }:
          do
            HttpUnprocessableEntityException.new(status, code, message)
          end
          	case { expr => EConst(CString(unsupported_media_type)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:162: characters 8-32) }:
          do
            HttpUnsupportedMediaTypeException.new(status, code, message)
          end
          	case { expr => EConst(CString(unsupported_res_class)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:163: characters 8-31) }:
          do
            UnsupportedResClassException.new(status, code, message)
          end
          	case { expr => EConst(CString(upgrade_required)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:164: characters 8-26) }:
          do
            HttpUpgradeRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CString(user_not_specified)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:165: characters 8-28) }:
          do
            UserNotSpecifiedException.new(status, code, message)
          end
          	case { expr => EConst(CString(variant_also_negotiates)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:166: characters 8-33) }:
          do
            HttpVariantAlsoNegotiatesException.new(status, code, message)
          end
          	case { expr => EConst(CString(vnc_proxy_request_failure)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:167: characters 8-35) }:
          do
            VncProxyRequestFailureException.new(status, code, message)
          end
          }

          switch ((status)) {
          	case { expr => EConst(CInt(400)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:172: characters 8-11) }:
          do
            HttpBadRequestException.new(status, code, message)
          end
          	case { expr => EConst(CInt(401)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:173: characters 8-11) }:
          do
            HttpUnauthorizedException.new(status, code, message)
          end
          	case { expr => EConst(CInt(402)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:174: characters 8-11) }:
          do
            HttpPaymentRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CInt(403)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:175: characters 8-11) }:
          do
            HttpForbiddenException.new(status, code, message)
          end
          	case { expr => EConst(CInt(404)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:176: characters 8-11) }:
          do
            HttpNotFoundException.new(status, code, message)
          end
          	case { expr => EConst(CInt(405)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:177: characters 8-11) }:
          do
            HttpMethodNotAllowedException.new(status, code, message)
          end
          	case { expr => EConst(CInt(406)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:178: characters 8-11) }:
          do
            HttpNotAcceptableException.new(status, code, message)
          end
          	case { expr => EConst(CInt(407)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:179: characters 8-11) }:
          do
            HttpProxyAuthenticationRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CInt(408)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:180: characters 8-11) }:
          do
            HttpRequestTimeoutException.new(status, code, message)
          end
          	case { expr => EConst(CInt(409)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:181: characters 8-11) }:
          do
            HttpConflictException.new(status, code, message)
          end
          	case { expr => EConst(CInt(410)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:182: characters 8-11) }:
          do
            HttpGoneException.new(status, code, message)
          end
          	case { expr => EConst(CInt(411)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:183: characters 8-11) }:
          do
            HttpLengthRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CInt(412)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:184: characters 8-11) }:
          do
            HttpPreconditionFailedException.new(status, code, message)
          end
          	case { expr => EConst(CInt(413)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:185: characters 8-11) }:
          do
            HttpRequestEntityTooLargeException.new(status, code, message)
          end
          	case { expr => EConst(CInt(415)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:186: characters 8-11) }:
          do
            HttpUnsupportedMediaTypeException.new(status, code, message)
          end
          	case { expr => EConst(CInt(416)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:187: characters 8-11) }:
          do
            HttpRequestedRangeNotSatisfiableException.new(status, code, message)
          end
          	case { expr => EConst(CInt(417)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:188: characters 8-11) }:
          do
            HttpExpectationFailedException.new(status, code, message)
          end
          	case { expr => EConst(CInt(422)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:189: characters 8-11) }:
          do
            HttpUnprocessableEntityException.new(status, code, message)
          end
          	case { expr => EConst(CInt(423)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:190: characters 8-11) }:
          do
            HttpLockedException.new(status, code, message)
          end
          	case { expr => EConst(CInt(424)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:191: characters 8-11) }:
          do
            HttpFailedDependencyException.new(status, code, message)
          end
          	case { expr => EConst(CInt(426)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:192: characters 8-11) }:
          do
            HttpUpgradeRequiredException.new(status, code, message)
          end
          	case { expr => EConst(CInt(500)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:193: characters 8-11) }:
          do
            HttpRequestUriTooLongException.new(status, code, message)
          end
          	case { expr => EConst(CInt(501)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:194: characters 8-11) }:
          do
            HttpNotImplementedException.new(status, code, message)
          end
          	case { expr => EConst(CInt(502)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:195: characters 8-11) }:
          do
            HttpBadGatewayException.new(status, code, message)
          end
          	case { expr => EConst(CInt(503)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:196: characters 8-11) }:
          do
            HttpServiceUnavailableException.new(status, code, message)
          end
          	case { expr => EConst(CInt(504)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:197: characters 8-11) }:
          do
            HttpGatewayTimeoutException.new(status, code, message)
          end
          	case { expr => EConst(CInt(505)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:198: characters 8-11) }:
          do
            HttpHttpVersionNotSupportedException.new(status, code, message)
          end
          	case { expr => EConst(CInt(506)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:199: characters 8-11) }:
          do
            HttpVariantAlsoNegotiatesException.new(status, code, message)
          end
          	case { expr => EConst(CInt(507)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:200: characters 8-11) }:
          do
            HttpInsufficientStorageException.new(status, code, message)
          end
          	case { expr => EConst(CInt(510)), pos => #pos(src/haxe/saclient/cloud/errors/HttpException.hx:201: characters 8-11) }:
          do
            HttpNotExtendedException.new(status, code, message)
          end
          }

          Saclient::Cloud::Errors::HttpException.new(status, code, message)
        end

      end

    end
  end
end
