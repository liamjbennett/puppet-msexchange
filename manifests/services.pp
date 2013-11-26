class msexchange::services(
  $package_roles
){

   if $caller_module_name != $module_name {
     fail("Use of private class ${name} by ${caller_module_name}")
   }
   
   Class['msexchange::install'] -> Class['msexchange::services']
   
   include msexchange::params
   
   #http://technet.microsoft.com/en-us/library/ee423542(v=exchg.141).aspx
   
   if member($package_roles,'ClientAccess') {
       ensure_resource('msexchange::services::windows_service', 'MSExchangeADTopology', {
         'ensure' => $service_MSExchangeADTopology
       })  
       ensure_resource('msexchange::services::windows_service', 'MSExchangeAB', {
         'ensure' => $service_MSExchangeAB
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeFDS', {
         'ensure' => $service_MSExchangeFDS
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeFBA', {
         'ensure' => $service_MSExchangeFBA
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeIMAP4', {
         'ensure' => $service_MSExchangeIMAP4
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeMailboxReplication', {
         'ensure' => $service_MSExchangeMailboxReplication
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangePOP3', {
         'ensure' => $service_MSExchangePOP3
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeProtectedServiceHost', {
         'ensure' => $service_MSExchangeProtectedServiceHost
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeRPC', {
         'ensure' => $service_MSExchangeRPC
       })
   }
   
   if member($package_roles,'HubTransport') {
       ensure_resource('msexchange::services::windows_service', 'MSExchangeADTopology', {
         'ensure' => $service_MSExchangeADTopology
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeAntispamUpdate', {
         'ensure' => $service_MSExchangeAntispamUpdate
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeEdgeSync', {
         'ensure' => $service_MSExchangeEdgeSync
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeProtectedServiceHost', {
         'ensure' => $service_MSExchangeProtectedServiceHost
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeTransport', {
         'ensure' => $service_MSExchangeTransport
       })   
       ensure_resource('msexchange::services::windows_service', 'MSExchangeTransportLogSearch', {
         'ensure' => $service_MSExchangeTransportLogSearch
       }) 
   }
   
   if member($package_roles,'EdgeTransport') {
       ensure_resource('msexchange::services::windows_service', 'ADAM_MSExchange', {
         'ensure' => $service_ADAM_MSExchange
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeEdgeCredential', {
         'ensure' => $service_MSExchangeEdgeCredential
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeEdgeCredential', {
         'ensure' => $service_MSExchangeEdgeCredential
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeTransport', {
         'ensure' => $service_MSExchangeTransport
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeTransportLogSearch', {
         'ensure' => $service_MSExchangeTransportLogSearch
       })              
   }
   
   if member($package_roles,'Mailbox') {
       ensure_resource('msexchange::services::windows_service', 'MSExchangeADTopology', {
         'ensure' => $service_MSExchangeADTopology
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeIS', {
         'ensure' => $service_MSExchangeIS
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeMailSubmission', {
         'ensure' => $service_MSExchangeMailSubmission
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeMailboxAssistants', {
         'ensure' => $service_MSExchangeMailboxAssistants
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeRepl', {
         'ensure' => $service_MSExchangeRepl
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeRPC', {
         'ensure' => $service_MSExchangeRPC
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeSearch', {
         'ensure' => $service_MSExchangeSearch
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeSA', {
         'ensure' => $service_MSExchangeSA
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeThrottling', {
         'ensure' => $service_MSExchangeThrottling
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeTransportLogSearch', {
         'ensure' => $service_MSExchangeTransportLogSearch
       })
   }
   
  if member($package_roles,'UnifiedMessaging') {
       ensure_resource('msexchange::services::windows_service', 'MSExchangeADTopology', {
         'ensure' => $service_MSExchangeADTopology
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeFDS', {
         'ensure' => $service_MSExchangeFDS
       })
       ensure_resource('msexchange::services::windows_service', 'MSSpeechService', {
         'ensure' => $service_MSSpeechService
       })
       ensure_resource('msexchange::services::windows_service', 'MSExchangeUM', {
         'ensure' => $service_MSExchangeUM
       })
   }
   
   ensure_resource('msexchange::services::windows_service', 'MSExchangeMonitoring', {
     'ensure' => $service_MSExchangeMonitoring
   })
   ensure_resource('msexchange::services::windows_service', 'MSExchangeServiceHost', {
     'ensure' => $service_MSExchangeServiceHost
   })
}



