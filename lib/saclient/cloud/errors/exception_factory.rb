# -*- encoding: UTF-8 -*-

require_relative 'http_exception'
require_relative 'access_api_key_disabled_exception'
require_relative 'access_sakura_exception'
require_relative 'access_staff_exception'
require_relative 'access_token_exception'
require_relative 'access_xhr_or_api_key_exception'
require_relative 'account_not_found_exception'
require_relative 'account_not_specified_exception'
require_relative 'ambiguous_identifier_exception'
require_relative 'ambiguous_zone_exception'
require_relative 'api_proxy_timeout_exception'
require_relative 'api_proxy_timeout_non_get_exception'
require_relative 'archive_is_incomplete_exception'
require_relative 'boot_failure_by_lock_exception'
require_relative 'boot_failure_in_group_exception'
require_relative 'busy_exception'
require_relative 'cant_resize_smaller_exception'
require_relative 'cdrom_device_locked_exception'
require_relative 'cdrom_disabled_exception'
require_relative 'cdrom_in_use_exception'
require_relative 'cdrom_is_incomplete_exception'
require_relative 'connect_to_same_switch_exception'
require_relative 'contract_creation_exception'
require_relative 'copy_to_itself_exception'
require_relative 'delete_disk_b4_template_exception'
require_relative 'delete_ip_v6_nets_first_exception'
require_relative 'delete_res_b4_account_exception'
require_relative 'delete_router_b4_switch_exception'
require_relative 'delete_static_route_first_exception'
require_relative 'disconnect_b4_delete_exception'
require_relative 'disconnect_b4_update_exception'
require_relative 'disk_connection_limit_exception'
require_relative 'disk_is_copying_exception'
require_relative 'disk_is_not_available_exception'
require_relative 'disk_license_mismatch_exception'
require_relative 'disk_or_ss_in_migration_exception'
require_relative 'disk_stock_run_out_exception'
require_relative 'dns_arecord_not_found_exception'
require_relative 'dns_aaaa_record_not_found_exception'
require_relative 'dns_ptr_update_failure_exception'
require_relative 'duplicate_account_code_exception'
require_relative 'duplicate_entry_exception'
require_relative 'duplicate_user_code_exception'
require_relative 'file_not_uploaded_exception'
require_relative 'filter_array_comparison_exception'
require_relative 'filter_bad_operator_exception'
require_relative 'filter_null_comparison_exception'
require_relative 'filter_unknown_operator_exception'
require_relative 'ftp_cannot_close_exception'
require_relative 'ftp_is_already_close_exception'
require_relative 'ftp_is_already_open_exception'
require_relative 'ftp_must_be_closed_exception'
require_relative 'host_operation_failure_exception'
require_relative 'http_bad_gateway_exception'
require_relative 'http_bad_request_exception'
require_relative 'http_conflict_exception'
require_relative 'http_expectation_failed_exception'
require_relative 'http_failed_dependency_exception'
require_relative 'http_forbidden_exception'
require_relative 'http_gateway_timeout_exception'
require_relative 'http_gone_exception'
require_relative 'http_http_version_not_supported_exception'
require_relative 'http_insufficient_storage_exception'
require_relative 'http_internal_server_error_exception'
require_relative 'http_length_required_exception'
require_relative 'http_locked_exception'
require_relative 'http_method_not_allowed_exception'
require_relative 'http_not_acceptable_exception'
require_relative 'http_not_extended_exception'
require_relative 'http_not_found_exception'
require_relative 'http_not_implemented_exception'
require_relative 'http_payment_required_exception'
require_relative 'http_precondition_failed_exception'
require_relative 'http_proxy_authentication_required_exception'
require_relative 'http_request_entity_too_large_exception'
require_relative 'http_request_timeout_exception'
require_relative 'http_request_uri_too_long_exception'
require_relative 'http_requested_range_not_satisfiable_exception'
require_relative 'http_service_unavailable_exception'
require_relative 'http_unauthorized_exception'
require_relative 'http_unprocessable_entity_exception'
require_relative 'http_unsupported_media_type_exception'
require_relative 'http_upgrade_required_exception'
require_relative 'http_variant_also_negotiates_exception'
require_relative 'illegal_das_usage_exception'
require_relative 'in_migration_exception'
require_relative 'invalid_format_exception'
require_relative 'invalid_param_comb_exception'
require_relative 'invalid_range_exception'
require_relative 'invalid_uri_argument_exception'
require_relative 'ip_v6_net_already_attached_exception'
require_relative 'limit_count_in_account_exception'
require_relative 'limit_count_in_member_exception'
require_relative 'limit_count_in_network_exception'
require_relative 'limit_count_in_router_exception'
require_relative 'limit_count_in_zone_exception'
require_relative 'limit_memory_in_account_exception'
require_relative 'limit_size_in_account_exception'
require_relative 'missing_iso_image_exception'
require_relative 'missing_param_exception'
require_relative 'must_be_of_same_zone_exception'
require_relative 'no_display_response_exception'
require_relative 'not_for_router_exception'
require_relative 'not_replicating_exception'
require_relative 'not_with_hybridconn_exception'
require_relative 'old_storage_plan_exception'
require_relative 'operation_failure_exception'
require_relative 'operation_timeout_exception'
require_relative 'original_hash_mismatch_exception'
require_relative 'packet_filter_applying_exception'
require_relative 'packet_filter_version_mismatch_exception'
require_relative 'param_ip_not_found_exception'
require_relative 'param_res_not_found_exception'
require_relative 'payment_credit_card_exception'
require_relative 'payment_payment_exception'
require_relative 'payment_registration_exception'
require_relative 'payment_tel_certification_exception'
require_relative 'payment_unpayable_exception'
require_relative 'penalty_operation_exception'
require_relative 'replica_already_exists_exception'
require_relative 'replica_not_found_exception'
require_relative 'res_already_connected_exception'
require_relative 'res_already_disconnected_exception'
require_relative 'res_already_exists_exception'
require_relative 'res_used_in_zone_exception'
require_relative 'resource_path_not_found_exception'
require_relative 'run_out_of_ip_address_exception'
require_relative 'same_license_required_exception'
require_relative 'server_could_not_stop_exception'
require_relative 'server_is_cleaning_exception'
require_relative 'server_operation_failure_exception'
require_relative 'server_power_must_be_down_exception'
require_relative 'server_power_must_be_up_exception'
require_relative 'service_temporarily_unavailable_exception'
require_relative 'size_mismatch_exception'
require_relative 'snapshot_in_migration_exception'
require_relative 'still_creating_exception'
require_relative 'storage_abnormal_exception'
require_relative 'storage_operation_failure_exception'
require_relative 'switch_hybrid_connected_exception'
require_relative 'template_ftp_is_open_exception'
require_relative 'template_is_incomplete_exception'
require_relative 'too_many_request_exception'
require_relative 'unknown_exception'
require_relative 'unknown_os_type_exception'
require_relative 'unsupported_res_class_exception'
require_relative 'user_not_specified_exception'
require_relative 'vnc_proxy_request_failure_exception'

module Saclient
  module Cloud
    module Errors

      class ExceptionFactory

        # @param [String] message
        # @param [Integer] status
        # @param [String] code
        # @return [HttpException]
        def self.create(status, code = nil, message = '')
          case (code)
            when 'access_apikey_disabled'
              return Saclient::Cloud::Errors::AccessApiKeyDisabledException.new(status, code, message)
            when 'access_sakura'
              return Saclient::Cloud::Errors::AccessSakuraException.new(status, code, message)
            when 'access_staff'
              return Saclient::Cloud::Errors::AccessStaffException.new(status, code, message)
            when 'access_token'
              return Saclient::Cloud::Errors::AccessTokenException.new(status, code, message)
            when 'access_xhr_or_apikey'
              return Saclient::Cloud::Errors::AccessXhrOrApiKeyException.new(status, code, message)
            when 'account_not_found'
              return Saclient::Cloud::Errors::AccountNotFoundException.new(status, code, message)
            when 'account_not_specified'
              return Saclient::Cloud::Errors::AccountNotSpecifiedException.new(status, code, message)
            when 'ambiguous_identifier'
              return Saclient::Cloud::Errors::AmbiguousIdentifierException.new(status, code, message)
            when 'ambiguous_zone'
              return Saclient::Cloud::Errors::AmbiguousZoneException.new(status, code, message)
            when 'apiproxy_timeout'
              return Saclient::Cloud::Errors::ApiProxyTimeoutException.new(status, code, message)
            when 'apiproxy_timeout_non_get'
              return Saclient::Cloud::Errors::ApiProxyTimeoutNonGetException.new(status, code, message)
            when 'archive_is_incomplete'
              return Saclient::Cloud::Errors::ArchiveIsIncompleteException.new(status, code, message)
            when 'bad_gateway'
              return Saclient::Cloud::Errors::HttpBadGatewayException.new(status, code, message)
            when 'bad_request'
              return Saclient::Cloud::Errors::HttpBadRequestException.new(status, code, message)
            when 'boot_failure_by_lock'
              return Saclient::Cloud::Errors::BootFailureByLockException.new(status, code, message)
            when 'boot_failure_in_group'
              return Saclient::Cloud::Errors::BootFailureInGroupException.new(status, code, message)
            when 'busy'
              return Saclient::Cloud::Errors::BusyException.new(status, code, message)
            when 'cant_resize_smaller'
              return Saclient::Cloud::Errors::CantResizeSmallerException.new(status, code, message)
            when 'cdrom_device_locked'
              return Saclient::Cloud::Errors::CdromDeviceLockedException.new(status, code, message)
            when 'cdrom_disabled'
              return Saclient::Cloud::Errors::CdromDisabledException.new(status, code, message)
            when 'cdrom_in_use'
              return Saclient::Cloud::Errors::CdromInUseException.new(status, code, message)
            when 'cdrom_is_incomplete'
              return Saclient::Cloud::Errors::CdromIsIncompleteException.new(status, code, message)
            when 'conflict'
              return Saclient::Cloud::Errors::HttpConflictException.new(status, code, message)
            when 'connect_to_same_switch'
              return Saclient::Cloud::Errors::ConnectToSameSwitchException.new(status, code, message)
            when 'contract_creation'
              return Saclient::Cloud::Errors::ContractCreationException.new(status, code, message)
            when 'copy_to_itself'
              return Saclient::Cloud::Errors::CopyToItselfException.new(status, code, message)
            when 'delete_disk_b4_template'
              return Saclient::Cloud::Errors::DeleteDiskB4TemplateException.new(status, code, message)
            when 'delete_ipv6nets_first'
              return Saclient::Cloud::Errors::DeleteIpV6NetsFirstException.new(status, code, message)
            when 'delete_res_b4_account'
              return Saclient::Cloud::Errors::DeleteResB4AccountException.new(status, code, message)
            when 'delete_router_b4_switch'
              return Saclient::Cloud::Errors::DeleteRouterB4SwitchException.new(status, code, message)
            when 'delete_static_route_first'
              return Saclient::Cloud::Errors::DeleteStaticRouteFirstException.new(status, code, message)
            when 'disconnect_b4_delete'
              return Saclient::Cloud::Errors::DisconnectB4DeleteException.new(status, code, message)
            when 'disconnect_b4_update'
              return Saclient::Cloud::Errors::DisconnectB4UpdateException.new(status, code, message)
            when 'disk_connection_limit'
              return Saclient::Cloud::Errors::DiskConnectionLimitException.new(status, code, message)
            when 'disk_is_copying'
              return Saclient::Cloud::Errors::DiskIsCopyingException.new(status, code, message)
            when 'disk_is_not_available'
              return Saclient::Cloud::Errors::DiskIsNotAvailableException.new(status, code, message)
            when 'disk_license_mismatch'
              return Saclient::Cloud::Errors::DiskLicenseMismatchException.new(status, code, message)
            when 'disk_stock_run_out'
              return Saclient::Cloud::Errors::DiskStockRunOutException.new(status, code, message)
            when 'diskorss_in_migration'
              return Saclient::Cloud::Errors::DiskOrSsInMigrationException.new(status, code, message)
            when 'dns_a_record_not_found'
              return Saclient::Cloud::Errors::DnsARecordNotFoundException.new(status, code, message)
            when 'dns_aaaa_record_not_found'
              return Saclient::Cloud::Errors::DnsAaaaRecordNotFoundException.new(status, code, message)
            when 'dns_ptr_update_failure'
              return Saclient::Cloud::Errors::DnsPtrUpdateFailureException.new(status, code, message)
            when 'duplicate_account_code'
              return Saclient::Cloud::Errors::DuplicateAccountCodeException.new(status, code, message)
            when 'duplicate_entry'
              return Saclient::Cloud::Errors::DuplicateEntryException.new(status, code, message)
            when 'duplicate_user_code'
              return Saclient::Cloud::Errors::DuplicateUserCodeException.new(status, code, message)
            when 'expectation_failed'
              return Saclient::Cloud::Errors::HttpExpectationFailedException.new(status, code, message)
            when 'failed_dependency'
              return Saclient::Cloud::Errors::HttpFailedDependencyException.new(status, code, message)
            when 'file_not_uploaded'
              return Saclient::Cloud::Errors::FileNotUploadedException.new(status, code, message)
            when 'filter_array_comparison'
              return Saclient::Cloud::Errors::FilterArrayComparisonException.new(status, code, message)
            when 'filter_bad_operator'
              return Saclient::Cloud::Errors::FilterBadOperatorException.new(status, code, message)
            when 'filter_null_comparison'
              return Saclient::Cloud::Errors::FilterNullComparisonException.new(status, code, message)
            when 'filter_unknown_operator'
              return Saclient::Cloud::Errors::FilterUnknownOperatorException.new(status, code, message)
            when 'forbidden'
              return Saclient::Cloud::Errors::HttpForbiddenException.new(status, code, message)
            when 'ftp_cannot_close'
              return Saclient::Cloud::Errors::FtpCannotCloseException.new(status, code, message)
            when 'ftp_is_already_close'
              return Saclient::Cloud::Errors::FtpIsAlreadyCloseException.new(status, code, message)
            when 'ftp_is_already_open'
              return Saclient::Cloud::Errors::FtpIsAlreadyOpenException.new(status, code, message)
            when 'ftp_must_be_closed'
              return Saclient::Cloud::Errors::FtpMustBeClosedException.new(status, code, message)
            when 'gateway_timeout'
              return Saclient::Cloud::Errors::HttpGatewayTimeoutException.new(status, code, message)
            when 'gone'
              return Saclient::Cloud::Errors::HttpGoneException.new(status, code, message)
            when 'host_operation_failure'
              return Saclient::Cloud::Errors::HostOperationFailureException.new(status, code, message)
            when 'http_version_not_supported'
              return Saclient::Cloud::Errors::HttpHttpVersionNotSupportedException.new(status, code, message)
            when 'illegal_das_usage'
              return Saclient::Cloud::Errors::IllegalDasUsageException.new(status, code, message)
            when 'in_migration'
              return Saclient::Cloud::Errors::InMigrationException.new(status, code, message)
            when 'insufficient_storage'
              return Saclient::Cloud::Errors::HttpInsufficientStorageException.new(status, code, message)
            when 'internal_server_error'
              return Saclient::Cloud::Errors::HttpInternalServerErrorException.new(status, code, message)
            when 'invalid_format'
              return Saclient::Cloud::Errors::InvalidFormatException.new(status, code, message)
            when 'invalid_param_comb'
              return Saclient::Cloud::Errors::InvalidParamCombException.new(status, code, message)
            when 'invalid_range'
              return Saclient::Cloud::Errors::InvalidRangeException.new(status, code, message)
            when 'invalid_uri_argument'
              return Saclient::Cloud::Errors::InvalidUriArgumentException.new(status, code, message)
            when 'ipv6net_already_attached'
              return Saclient::Cloud::Errors::IpV6NetAlreadyAttachedException.new(status, code, message)
            when 'length_required'
              return Saclient::Cloud::Errors::HttpLengthRequiredException.new(status, code, message)
            when 'limit_count_in_account'
              return Saclient::Cloud::Errors::LimitCountInAccountException.new(status, code, message)
            when 'limit_count_in_member'
              return Saclient::Cloud::Errors::LimitCountInMemberException.new(status, code, message)
            when 'limit_count_in_network'
              return Saclient::Cloud::Errors::LimitCountInNetworkException.new(status, code, message)
            when 'limit_count_in_router'
              return Saclient::Cloud::Errors::LimitCountInRouterException.new(status, code, message)
            when 'limit_count_in_zone'
              return Saclient::Cloud::Errors::LimitCountInZoneException.new(status, code, message)
            when 'limit_memory_in_account'
              return Saclient::Cloud::Errors::LimitMemoryInAccountException.new(status, code, message)
            when 'limit_size_in_account'
              return Saclient::Cloud::Errors::LimitSizeInAccountException.new(status, code, message)
            when 'locked'
              return Saclient::Cloud::Errors::HttpLockedException.new(status, code, message)
            when 'method_not_allowed'
              return Saclient::Cloud::Errors::HttpMethodNotAllowedException.new(status, code, message)
            when 'missing_iso_image'
              return Saclient::Cloud::Errors::MissingIsoImageException.new(status, code, message)
            when 'missing_param'
              return Saclient::Cloud::Errors::MissingParamException.new(status, code, message)
            when 'must_be_of_same_zone'
              return Saclient::Cloud::Errors::MustBeOfSameZoneException.new(status, code, message)
            when 'no_display_response'
              return Saclient::Cloud::Errors::NoDisplayResponseException.new(status, code, message)
            when 'not_acceptable'
              return Saclient::Cloud::Errors::HttpNotAcceptableException.new(status, code, message)
            when 'not_extended'
              return Saclient::Cloud::Errors::HttpNotExtendedException.new(status, code, message)
            when 'not_for_router'
              return Saclient::Cloud::Errors::NotForRouterException.new(status, code, message)
            when 'not_found'
              return Saclient::Cloud::Errors::HttpNotFoundException.new(status, code, message)
            when 'not_implemented'
              return Saclient::Cloud::Errors::HttpNotImplementedException.new(status, code, message)
            when 'not_replicating'
              return Saclient::Cloud::Errors::NotReplicatingException.new(status, code, message)
            when 'not_with_hybridconn'
              return Saclient::Cloud::Errors::NotWithHybridconnException.new(status, code, message)
            when 'old_storage_plan'
              return Saclient::Cloud::Errors::OldStoragePlanException.new(status, code, message)
            when 'operation_failure'
              return Saclient::Cloud::Errors::OperationFailureException.new(status, code, message)
            when 'operation_timeout'
              return Saclient::Cloud::Errors::OperationTimeoutException.new(status, code, message)
            when 'original_hash_mismatch'
              return Saclient::Cloud::Errors::OriginalHashMismatchException.new(status, code, message)
            when 'packetfilter_applying'
              return Saclient::Cloud::Errors::PacketFilterApplyingException.new(status, code, message)
            when 'packetfilter_version_mismatch'
              return Saclient::Cloud::Errors::PacketFilterVersionMismatchException.new(status, code, message)
            when 'param_ip_not_found'
              return Saclient::Cloud::Errors::ParamIpNotFoundException.new(status, code, message)
            when 'param_res_not_found'
              return Saclient::Cloud::Errors::ParamResNotFoundException.new(status, code, message)
            when 'payment_creditcard'
              return Saclient::Cloud::Errors::PaymentCreditCardException.new(status, code, message)
            when 'payment_payment'
              return Saclient::Cloud::Errors::PaymentPaymentException.new(status, code, message)
            when 'payment_registration'
              return Saclient::Cloud::Errors::PaymentRegistrationException.new(status, code, message)
            when 'payment_required'
              return Saclient::Cloud::Errors::HttpPaymentRequiredException.new(status, code, message)
            when 'payment_telcertification'
              return Saclient::Cloud::Errors::PaymentTelCertificationException.new(status, code, message)
            when 'payment_unpayable'
              return Saclient::Cloud::Errors::PaymentUnpayableException.new(status, code, message)
            when 'penalty_operation'
              return Saclient::Cloud::Errors::PenaltyOperationException.new(status, code, message)
            when 'precondition_failed'
              return Saclient::Cloud::Errors::HttpPreconditionFailedException.new(status, code, message)
            when 'proxy_authentication_required'
              return Saclient::Cloud::Errors::HttpProxyAuthenticationRequiredException.new(status, code, message)
            when 'replica_already_exists'
              return Saclient::Cloud::Errors::ReplicaAlreadyExistsException.new(status, code, message)
            when 'replica_not_found'
              return Saclient::Cloud::Errors::ReplicaNotFoundException.new(status, code, message)
            when 'request_entity_too_large'
              return Saclient::Cloud::Errors::HttpRequestEntityTooLargeException.new(status, code, message)
            when 'request_timeout'
              return Saclient::Cloud::Errors::HttpRequestTimeoutException.new(status, code, message)
            when 'request_uri_too_long'
              return Saclient::Cloud::Errors::HttpRequestUriTooLongException.new(status, code, message)
            when 'requested_range_not_satisfiable'
              return Saclient::Cloud::Errors::HttpRequestedRangeNotSatisfiableException.new(status, code, message)
            when 'res_already_connected'
              return Saclient::Cloud::Errors::ResAlreadyConnectedException.new(status, code, message)
            when 'res_already_disconnected'
              return Saclient::Cloud::Errors::ResAlreadyDisconnectedException.new(status, code, message)
            when 'res_already_exists'
              return Saclient::Cloud::Errors::ResAlreadyExistsException.new(status, code, message)
            when 'res_used_in_zone'
              return Saclient::Cloud::Errors::ResUsedInZoneException.new(status, code, message)
            when 'resource_path_not_found'
              return Saclient::Cloud::Errors::ResourcePathNotFoundException.new(status, code, message)
            when 'run_out_of_ipaddress'
              return Saclient::Cloud::Errors::RunOutOfIpAddressException.new(status, code, message)
            when 'same_license_required'
              return Saclient::Cloud::Errors::SameLicenseRequiredException.new(status, code, message)
            when 'server_could_not_stop'
              return Saclient::Cloud::Errors::ServerCouldNotStopException.new(status, code, message)
            when 'server_is_cleaning'
              return Saclient::Cloud::Errors::ServerIsCleaningException.new(status, code, message)
            when 'server_operation_failure'
              return Saclient::Cloud::Errors::ServerOperationFailureException.new(status, code, message)
            when 'server_power_must_be_down'
              return Saclient::Cloud::Errors::ServerPowerMustBeDownException.new(status, code, message)
            when 'server_power_must_be_up'
              return Saclient::Cloud::Errors::ServerPowerMustBeUpException.new(status, code, message)
            when 'service_temporarily_unavailable'
              return Saclient::Cloud::Errors::ServiceTemporarilyUnavailableException.new(status, code, message)
            when 'service_unavailable'
              return Saclient::Cloud::Errors::HttpServiceUnavailableException.new(status, code, message)
            when 'size_mismatch'
              return Saclient::Cloud::Errors::SizeMismatchException.new(status, code, message)
            when 'snapshot_in_migration'
              return Saclient::Cloud::Errors::SnapshotInMigrationException.new(status, code, message)
            when 'still_creating'
              return Saclient::Cloud::Errors::StillCreatingException.new(status, code, message)
            when 'storage_abnormal'
              return Saclient::Cloud::Errors::StorageAbnormalException.new(status, code, message)
            when 'storage_operation_failure'
              return Saclient::Cloud::Errors::StorageOperationFailureException.new(status, code, message)
            when 'switch_hybrid_connected'
              return Saclient::Cloud::Errors::SwitchHybridConnectedException.new(status, code, message)
            when 'template_ftp_is_open'
              return Saclient::Cloud::Errors::TemplateFtpIsOpenException.new(status, code, message)
            when 'template_is_incomplete'
              return Saclient::Cloud::Errors::TemplateIsIncompleteException.new(status, code, message)
            when 'too_many_request'
              return Saclient::Cloud::Errors::TooManyRequestException.new(status, code, message)
            when 'unauthorized'
              return Saclient::Cloud::Errors::HttpUnauthorizedException.new(status, code, message)
            when 'unknown'
              return Saclient::Cloud::Errors::UnknownException.new(status, code, message)
            when 'unknown_os_type'
              return Saclient::Cloud::Errors::UnknownOsTypeException.new(status, code, message)
            when 'unprocessable_entity'
              return Saclient::Cloud::Errors::HttpUnprocessableEntityException.new(status, code, message)
            when 'unsupported_media_type'
              return Saclient::Cloud::Errors::HttpUnsupportedMediaTypeException.new(status, code, message)
            when 'unsupported_res_class'
              return Saclient::Cloud::Errors::UnsupportedResClassException.new(status, code, message)
            when 'upgrade_required'
              return Saclient::Cloud::Errors::HttpUpgradeRequiredException.new(status, code, message)
            when 'user_not_specified'
              return Saclient::Cloud::Errors::UserNotSpecifiedException.new(status, code, message)
            when 'variant_also_negotiates'
              return Saclient::Cloud::Errors::HttpVariantAlsoNegotiatesException.new(status, code, message)
            when 'vnc_proxy_request_failure'
              return Saclient::Cloud::Errors::VncProxyRequestFailureException.new(status, code, message)
          end
          case (status)
            when 400
              return Saclient::Cloud::Errors::HttpBadRequestException.new(status, code, message)
            when 401
              return Saclient::Cloud::Errors::HttpUnauthorizedException.new(status, code, message)
            when 402
              return Saclient::Cloud::Errors::HttpPaymentRequiredException.new(status, code, message)
            when 403
              return Saclient::Cloud::Errors::HttpForbiddenException.new(status, code, message)
            when 404
              return Saclient::Cloud::Errors::HttpNotFoundException.new(status, code, message)
            when 405
              return Saclient::Cloud::Errors::HttpMethodNotAllowedException.new(status, code, message)
            when 406
              return Saclient::Cloud::Errors::HttpNotAcceptableException.new(status, code, message)
            when 407
              return Saclient::Cloud::Errors::HttpProxyAuthenticationRequiredException.new(status, code, message)
            when 408
              return Saclient::Cloud::Errors::HttpRequestTimeoutException.new(status, code, message)
            when 409
              return Saclient::Cloud::Errors::HttpConflictException.new(status, code, message)
            when 410
              return Saclient::Cloud::Errors::HttpGoneException.new(status, code, message)
            when 411
              return Saclient::Cloud::Errors::HttpLengthRequiredException.new(status, code, message)
            when 412
              return Saclient::Cloud::Errors::HttpPreconditionFailedException.new(status, code, message)
            when 413
              return Saclient::Cloud::Errors::HttpRequestEntityTooLargeException.new(status, code, message)
            when 415
              return Saclient::Cloud::Errors::HttpUnsupportedMediaTypeException.new(status, code, message)
            when 416
              return Saclient::Cloud::Errors::HttpRequestedRangeNotSatisfiableException.new(status, code, message)
            when 417
              return Saclient::Cloud::Errors::HttpExpectationFailedException.new(status, code, message)
            when 422
              return Saclient::Cloud::Errors::HttpUnprocessableEntityException.new(status, code, message)
            when 423
              return Saclient::Cloud::Errors::HttpLockedException.new(status, code, message)
            when 424
              return Saclient::Cloud::Errors::HttpFailedDependencyException.new(status, code, message)
            when 426
              return Saclient::Cloud::Errors::HttpUpgradeRequiredException.new(status, code, message)
            when 500
              return Saclient::Cloud::Errors::HttpRequestUriTooLongException.new(status, code, message)
            when 501
              return Saclient::Cloud::Errors::HttpNotImplementedException.new(status, code, message)
            when 502
              return Saclient::Cloud::Errors::HttpBadGatewayException.new(status, code, message)
            when 503
              return Saclient::Cloud::Errors::HttpServiceUnavailableException.new(status, code, message)
            when 504
              return Saclient::Cloud::Errors::HttpGatewayTimeoutException.new(status, code, message)
            when 505
              return Saclient::Cloud::Errors::HttpHttpVersionNotSupportedException.new(status, code, message)
            when 506
              return Saclient::Cloud::Errors::HttpVariantAlsoNegotiatesException.new(status, code, message)
            when 507
              return Saclient::Cloud::Errors::HttpInsufficientStorageException.new(status, code, message)
            when 510
              return Saclient::Cloud::Errors::HttpNotExtendedException.new(status, code, message)
          end
          return Saclient::Cloud::Errors::HttpException.new(status, code, message)
        end

      end

    end
  end
end
