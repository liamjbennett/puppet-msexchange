define msexchange::services::windows_service(
$ensure = 'running',
$enable = 'automatic'
){
    
    $sc_cmd_ensure = $ensure ? {
      /(true|running)/ => 'start',
      /(false|stopped)/  => 'stop'
    }
    
    $sc_ensure_state = $ensure ? {
        /(true|running)/ => 'RUNNING',
        /(false|stopped)/  => 'STOPPED'
    }
    
    $sc_cmd_enable = $enable ? {
        /(true|automatic)/ => 'automatic',
        /(false|disabled)/ => 'disabled',
        'demand' => 'demand',
        'manual' => 'manual'
    }
    
    $sc_enable_state = $enable ? {
        /(true|automatic)/ => 'AUTO_START',
        /(false|disabled)/ => 'DISABLED',
        'manual' => 'DEMAND_START'
    }
    
    exec { "manage_${name}_service_ensure":
      command => "C:\\Windows\\System32\\cmd.exe /c sc ${sc_cmd_ensure} \"${title}\"",
      unless  => "C:\\Windows\\System32\\cmd.exe /c sc query \"${title}\" | Find \"${sc_ensure_state}\"",
    }
    
    exec { "manage_${name}_service_enable":
      command => "C:\\Windows\\System32\\cmd.exe /c sc config \"${title}\" start= ${sc_cmd_enable}",
      onlyif  => "C:\\Windows\\System32\\cmd.exe /c sc qc \"${title}\" | Find \"START_TYPE\" | Find \"${sc_enable_state}\"",
    }
}