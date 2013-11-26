class msexchange::params {
    
    $deployment_root = hiera('windows_deployment_root')
    $package_ensure = hiera('msexchange_package_ensure','present')
    $package_version = hiera('msexchange_package_version','2010')
    
    $package_roles = hiera('msexchange_package_roles', ['ClientAccess','HubTransport','Mailbox','UnifiedMessaging'])
    
    $user = hiera('msexchange_user')
    $dc = hiera('msexchange_dc')
    $password = hiera('msexchange_password')
    $upgrade = hiera('msexchange_upgrade',false)
    $options = hiera('msexchange_options',{})
    
    $organization_name = hiera('msexchange_org_name', 'nil')
    $source_dir = hiera('msexchange_sourcedir')
    $update_dir = hiera('msexchange_updatedir')
    $win_components = hiera('msexchange_install_win_components','nil')
    $feedback = hiera('msexchange_feedback_enabled','false')
    $industry = hiera('msexchange_industry','')
    $error_reporting = hiera('msexchange_enable_error_reporting','nil')
    
    $service_MSExchangeADTopology = hiera('msexchange::services::MSExchangeADTopology::ensure', 'running')
    $service_ADAM_MSExchange = hiera('msexchange::services::ADAM_MSExchange::ensure', 'running')
    $service_MSExchangeAB = hiera('msexchange::services::MSExchangeAB::ensure', 'running')
    $service_MSExchangeAntispamUpdate = hiera('msexchange::services::MSExchangeAntispamUpdate::ensure', 'running')
    $service_MSExchangeEdgeCredential = hiera('msexchange::services::MSExchangeEdgeCredential::ensure', 'running')
    $service_MSExchangeEdgeSync = hiera('msexchange::services::MSExchangeEdgeSync::ensure', 'running')
    $service_MSExchangeFDS = hiera('msexchange::services::MSExchangeFDS::ensure', 'running')
    $service_MSExchangeFBA = hiera('msexchange::services::MSExchangeFBA::ensure', 'running')
    $service_MSExchangeIMAP4 = hiera('msexchange::services::MSExchangeIMAP4::ensure', 'running')
    $service_MSExchangeIS = hiera('msexchange::services::MSExchangeIS::ensure', 'running')
    $service_MSExchangeMailSubmission = hiera('msexchange::services::MSExchangeMailSubmission::ensure', 'running')
    $service_MSExchangeMailboxAssistants = hiera('msexchange::services::MSExchangeMailboxAssistants::ensure', 'running')
    $service_MSExchangeMailboxReplication = hiera('msexchange::services::MSExchangeMailboxReplication::ensure', 'running')
    $service_MSExchangeMonitoring = hiera('msexchange::services::MSExchangeMonitoring::ensure', 'running')
    $service_MSExchangePOP3 = hiera('msexchange::services::MSExchangePOP3::ensure', 'running')
    $service_MSExchangeProtectedServiceHost = hiera('msexchange::services::MSExchangeProtectedServiceHost::ensure', 'running')
    $service_MSExchangeRepl = hiera('msexchange::services::MSExchangeRepl::ensure', 'running')
    $service_MSExchangeRPC = hiera('msexchange::services::MSExchangeRPC::ensure', 'running')
    $service_MSExchangeSearch = hiera('msexchange::services::MSExchangeSearch::ensure', 'running')
    $service_WSBExchange = hiera('msexchange::services::WSBExchange::ensure', 'running')
    $service_MSExchangeServiceHost = hiera('msexchange::services::MSExchangeServiceHost::ensure', 'running')
    $service_MSExchangeSA = hiera('msexchange::services::MSExchangeSA::ensure', 'running')
    $service_MSExchangeThrottling = hiera('msexchange::services::MSExchangeThrottling::ensure', 'running')
    $service_MSExchangeTransport = hiera('msexchange::services::MSExchangeTransport::ensure', 'running')  
    $service_MSExchangeTransportLogSearch = hiera('msexchange::services::MSExchangeTransportLogSearch::ensure', 'running')
    $service_MSExchangeUM = hiera('msexchange::services::MSExchangeUM::ensure', 'running')
    $service_MSSpeechService = hiera('msexchange::services::MSSpeechService::ensure', 'running')
    
    $roles = {
        'HubTransport' => {
            'long'    => 'HubTransport',
            'short'   => 'HT',
            'mini'    => 'H',
            'options' => {
              'OrganizationName'          => $organization_name,
              'SourceDir'                 => $source_dir,
              'UpdatesDir'                => $update_dir,
              'DomainController'          => $dc,
              'InstallWindowsCompontents' => $win_components,
              'Industry'                  => $industry,
              'EnableErrorReporting'      => $error_reporting,
              'DoNotStartTransport'       => hiera('msexchange_dont_start_transport','nil'),
              'LegacyRoutingServer'       => hiera('msexchange_legacy_routing_server','')
            }
        },
        'ClientAccess' => {
            'long'  => 'ClientAccess',
            'short' => 'CA',
            'mini'  => 'C',
            'options' => {
              'OrganizationName'          => $organization_name,
              'SourceDir'                 => $source_dir,
              'UpdatesDir'                => $update_dir,
              'DomainController'          => $dc,
              'InstallWindowsCompontents' => $win_components,
              'Industry'                  => $industry,
              'EnableErrorReporting'      => $error_reporting,
              'ExternalCASServerDomain'   => hiera('msexchange_external_cas_domain',''),
              'NoSelfSignedCertificates'  => hiera('msexchange_no_ssl_certs', 'nil')
            }

        },
        'Mailbox' => {
            'long'  => 'Mailbox',
            'short' => 'MB',
            'mini'  => 'M',
            'options' => {
              'OrganizationName'          => $organization_name,
              'SourceDir'                 => $source_dir,
              'UpdatesDir'                => $update_dir,
              'DomainController'          => $dc,
              'InstallWindowsCompontents' => $win_components,
              'Industry'                  => $industry,
              'EnableErrorReporting'      => $error_reporting,
              'EnableLegacyOutlook'       => hiera('msexchange_enable_legacy_outlook','nil'),
              'Mdbname'                   => hiera('msexchange_mdbname',''),
              'DbFilePath'                => hiera('msexchange_dbfilepath',''),
              'LogFileFolder'             => hiera('msexchange_log_folder','')
            }
        },
        'UnifiedMessaging' => {
            'long'  => 'UnifiedMessaging',
            'short' => 'UM',
            'mini'  => 'M',
            'options' => {
              'OrganizationName'          => $organization_name,
              'SourceDir'                 => $source_dir,
              'UpdatesDir'                => $update_dir,
              'DomainController'          => $dc,
              'InstallWindowsCompontents' => $win_components,
              'Industry'                  => $industry,
              'EnableErrorReporting'      => $error_reporting,
              'NoSelfSignedCertificates'  => hiera('msexchange_no_ssl_certs', 'nil')
            }
        },
        'EdgeTransport' => {
            'long'  => 'EdgeTransport',
            'short' => 'ET',
            'mini'  => 'E',
            'options' => {
              'OrganizationName'          => $organization_name,
              'SourceDir'                 => $source_dir,
              'UpdatesDir'                => $update_dir,
              'InstallWindowsCompontents' => $win_components,
              'Industry'                  => $industry,
              'EnableErrorReporting'      => $error_reporting,
              'DoNotStartTransport'       => hiera('msexchange_dont_start_transport', 'nil'),
              'AdamLdapPort'              => hiera('msexchange_adam_ldap_port', ''),
              'AdamSslPort'               => hiera('msexchange_adam_ssl _port', '')
            }
        },
        'ManagementTools' => {
            'long'  => 'ManagementTools',
            'short' => 'MT',
            'mini'  => 'M',
            'options' => {
              'OrganizationName'          => $organization_name,
              'SourceDir'                 => $source_dir,
              'UpdatesDir'                => $update_dir,
              'DomainController'          => $dc,
              'InstallWindowsCompontents' => $win_components,
              'Industry'                  => $industry,
              'EnableErrorReporting'      => $error_reporting,
            },
        }
    }
    
    $filter_reg_key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{95140000-2000-0409-1000-0000000FF1CE}"

    if $::architecture == 'x64' {
      $filter_package = 'FilterPack64bit.exe'
    } else {
      $filter_package = 'FilterPack32bit.exe'
    }
    
    $filter_link = "http://download.microsoft.com/download/0/A/2/0A28BBFA-CBFA-4C03-A739-30CCA5E21659/${msexchange::params::filter_package}"
    
    $vcredist_reg_key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{350AA351-21FA-3270-8B7A-835434E766AD}"
    
    if $::architecture == 'x64' {
      $vcredist_package = 'vcredist_x64.exe'
    } else {
      $vcredist_package = 'vcredist_x86.exe'
    }
    
    $vcredist_link = "http://download.microsoft.com/download/d/2/4/d242c3fb-da5a-4542-ad66-f9661d0a8d19/${msexchange::params::vcredist_package}"
    
    #x64
    $ucma_reg_key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{7EB901DD-CB50-4046-A434-3E9A112E8F86}"
    $ucma_link = "https://dl.dropboxusercontent.com/u/22525147/Ucma_2.0/UcmaRuntime.msi"
    
    #x64
    $speechplatform_reg_key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{3B433097-E62E-4BF5-97F9-4AF6E1C2409C}"
    $speechplatform_package = 'SpeechPlatformRuntime.msi'
    
    if $::architecture == 'x64' {
      $speechplatform_link = "http://download.microsoft.com/download/0/4/0/040235F1-3798-4B10-BB36-FAF870A8D559/Runtime/x64/${msexchange::params::speechplatform_package}"
    } else {
      $speechplatform_link = "http://download.microsoft.com/download/0/4/0/040235F1-3798-4B10-BB36-FAF870A8D559/Runtime/x/${msexchange::params::speechplatform_package}"
    }   
}