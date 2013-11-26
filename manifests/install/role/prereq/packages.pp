class msexchange::install::role::prereq::packages(
  $package_roles
){ 
    #TODO: support other packaging options
    #TODO: support removal
    #TODO: extract these into seperate modules
    
    include msexchange::params
    
    
    if member($package_roles,'Mailbox') or member($package_roles,'HubTransport') {
        
        exec { "download-FilterPack":
          command   => "(new-object System.Net.WebClient).Downloadfile('${msexchange::params::filter_link}', 'C:\\Windows\\Temp\\${msexchange::params::filter_package}');",
          provider  => powershell,
          logoutput => true,
          creates   => "C:\\Windows\\Temp\\${msexchange::params::filter_package}"
        }
    
        exec { "install-FilterPack":
          command => "& C:\\Windows\\Temp\\${msexchange::params::filter_package} /quiet /norestart",
          provider  => powershell,
          logoutput => true,
          onlyif    => "if (Get-Item -LiteralPath \'${msexchange::params::filter_reg_key}\' -ErrorAction SilentlyContinue) { exit 1 }",
          require => Exec["download-FilterPack"]
        }
    }
    
    if member($package_roles,'UnifiedMessaging') {
        
        exec { "download-VcRedist": 
          command   => "(new-object System.Net.WebClient).Downloadfile('${msexchange::params::vcredist_link}', 'C:\\Windows\\Temp\\${msexchange::params::vcredist_package}');",
          provider  => powershell,
          logoutput => true,
          creates   => "C:\\Windows\\Temp\\${msexchange::params::vcredist_package}"    
        }
        
        notify { "vcredist_reg_key is ${msexchange::params::vcredist_reg_key}": }
        
        exec { "install-VcRedist":
          command => "& C:\\Windows\\Temp\\${msexchange::params::vcredist_package} /q:a /c:\"msiexec /i vcredist.msi /qn /l*v C:\\Windows\\Temp\\vcredist.log\"",
          provider  => powershell,
          logoutput => true,
          onlyif    => "if (Get-Item -LiteralPath \'${msexchange::params::vcredist_reg_key}\' -ErrorAction SilentlyContinue) { exit 1 }",
          require => Exec["download-VcRedist"]
        }
        
        exec { "download-UcmaRuntime":
          command   => "(new-object System.Net.WebClient).Downloadfile('${msexchange::params::ucma_link}', 'C:\\Windows\\Temp\\UcmaRuntime.msi');",
          provider  => powershell,
          logoutput => true,
          creates   => "C:\\Windows\\Temp\\UcmaRuntime.msi"
        }
        
        # This is nasty - need to run the installer and grab the files from the %TEMP% directory
        # TODO: make this into a chocolatey package and/or stick on dropbox
        exec { "install-UcmaRuntime":
          command => "& C:\\Windows\\System32\\msiexec.exe /i C:\\Windows\\Temp\\UcmaRuntimeSetup.msi /qn BOOT=1",
          provider  => powershell,
          logoutput => true,
          onlyif    => "if (Get-Item -LiteralPath \'${msexchange::params::ucma_reg_key}\' -ErrorAction SilentlyContinue) { exit 1 }",
          require => [ Exec["download-UcmaRuntime"], Exec['install-VcRedist'] ]
        }
        
        exec { "download-SpeechPlatform": 
          command   => "(new-object System.Net.WebClient).Downloadfile('${msexchange::params::speechplatform_link}', 'C:\\Windows\\Temp\\${msexchange::params::speechplatform_package}');",
          provider  => powershell,
          logoutput => true,
          creates   => "C:\\Windows\\Temp\\${msexchange::params::speechplatform_package}"    
        }
        
        exec { "install-SpeechPlatform":
          command => "& C:\\Windows\\Temp\\${msexchange::params::speechplatform_package} /qn /norestart /l*v C:\\Windows\\Temp\\speech.txt",
          provider  => powershell,
          logoutput => true,
          onlyif    => "if (Get-Item -LiteralPath \'${msexchange::params::speech_reg_key}\' -ErrorAction SilentlyContinue) { exit 1 }",
          require => [ Exec['download-SpeechPlatform'], Exec['install-VcRedist'], Exec['install-UcmaRuntime'] ]
        }
    }    
}