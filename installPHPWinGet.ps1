powershell winget search php
# powershell winget install "Xampp" --silent
powershell winget install "ApacheFriends.Xampp" --silent
powershell winget install "CodeLite.CodeLite" --silent
winget install "OpenJS.NodeJS" --silent
#powershell winget install "" --silent
#powershell winget install "" --silent


## install chocolatey python visualstudio2019-workload-vctools
    # https://chocolatey.org/packages/chocolatey
    # https://chocolatey.org/packages/python
    # https://chocolatey.org/packages/visualstudio2019-workload-vctools
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command Start-Process '%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe' -ArgumentList '-NoProfile -InputFormat None -ExecutionPolicy Bypass -Command [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString(''https://chocolatey.org/install.ps1'')); choco upgrade -y python visualstudio2019-workload-vctools; Read-Host ''Type ENTER to exit'' ' -Verb RunAs

