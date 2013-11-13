class msexchange::params {
    
    $deployment_root = hiera('windows_deployment_root')
    $package_ensure = hiera('msexchange_package_ensure','present')
    $package_version = hiera('msexchange_package_version','2010')
    
    $package_roles = hiera('msexchange_package_roles', ['ClientAccess','HubTransport','Mailbox'])
    
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
            },
            'services' => {
                'MSExchangeADTopology'           => '',
                'MSExchangeAntispamUpdate'       => '',
                'MSExchangeEdgeSync'             => '',
                'MSExchangeMonitoring'           => '',
                'MSExchangeProtectedServiceHost' => '',
                'MSExchangeServiceHost'          => '',
                'MSExchangeTransport'            => '',
                'MSExchangeTransportLogSearch'   => '',
                'msftesql-Exchange'              => ''
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
            },
            'services' => {
                'MSExchangeADTopology'           => '',
                'MSExchangeAB'                   => '',
                'MSExchangeFDS'                  => '',
                'MSExchangeFBA'                  => '',
                'MSExchangeIMAP4'                => '',
                'MSExchangeMailboxReplication'   => '',
                'MSExchangePOP3'                 => '',
                'MSExchangeProtectedServiceHost' => '',
                'MSExchangeRPC'                  => '',
                'MSExchangeMonitoring'           => '',
                'MSExchangeServiceHost'          => ''
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
            },
            'services' => {
                'MSExchangeADTopology'         => '',
                'MSExchangeIS'                 => '',
                'MSExchangeMailSubmission'     => '',
                'MSExchangeMailboxAssistants'  => '',
                'MSExchangeMonitoring'         => '',
                'MSExchangeRepl'               => '',
                'MSExchangeSearch'             => '',
                'WSBExchange'                  => '',
                'MSExchangeServiceHost'        => '',
                'MSExchangeSA'                 => '',
                'MSExchangeThrottling'         => '',
                'MSExchangeTransportLogSearch' => '',
                'msftesql-Exchange'            => ''
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
            },
            'services' => {
                'MSExchangeADTopology'  => '',
                'MSSpeechService'       => '',
                'MSExchangeUM'          => '',
                'MSExchangeMonitoring'  => '',
                'MSExchangeServiceHost' => ''
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
              'DomainController'          => $dc,
              'InstallWindowsCompontents' => $win_components,
              'Industry'                  => $industry,
              'EnableErrorReporting'      => $error_reporting,
              'DoNotStartTransport'       => hiera('msexchange_dont_start_transport', 'nil'),
              'AdamLdapPort'              => hiera('msexchange_adam_ldap_port', ''),
              'AdamSslPort'               => hiera('msexchange_adam_ssl _port', '')
            },
            'services' => {
                'ADAM_MSExchange'              => '',
                'MSExchangeAntispamUpdate'     => '',
                'MSExchangeEdgeCredential'     => '',
                'MSExchangeTransport'          => '',
                'MSExchangeTransportLogSearch' => ''
                'MSExchangeMonitoring'         => '',
                'MSExchangeServiceHost'        => ''
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
}