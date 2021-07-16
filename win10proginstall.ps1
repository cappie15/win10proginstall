#     > powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://git.io/JJ8R4')"


### Require administrator privileges ###


Function Show-Choco-Menu {
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Title,
    
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ChocoInstall
    )
   
 do
 {
    Write-Host "================ $Title ================"
    Write-Host "Y: Press 'Y' to do this."
    Write-Host "2: Press 'N' to skip this."
	Write-Host "Q: Press 'Q' to stop the entire script."
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    'y' { choco install $ChocoInstall -y }
    'n' { Break }
    'q' { Exit  }
    }
 }
 until ($selection -match "y" -or $selection -match "n" -or $selection -match "q")
}


Write-Output "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install chocolatey-core.extension -y

	Write-Output "Installing Gamelaunchers & Nvidia Drivers"
	Show-Choco-Menu -Title "Do you want to install Nvidia drivers?" -ChocoInstall "nvidia-display-driver"
	Show-Choco-Menu -Title "Do you want to install Steam?" -ChocoInstall "steam"
	Show-Choco-Menu -Title "Do you want to install Ubisoft Connect?" -ChocoInstall "ubisoft-connect"
	Show-Choco-Menu -Title "Do you want to install Origin?" -ChocoInstall "origin"
	Write-Output "Installing Chrome"
	choco install googlechrome -y
	Write-Output "Installing 7-Zip"
	choco install 7zip -y
	Write-Output "Installing Notepad++"
	choco install notepadplusplus -y
	Write-Output "Installing VLC"
	choco install vlc -y
	Write-Output "Installing PowerToys"
	choco install powertoys -y
	Write-Output "Installing NFOpad"
	choco install nfopad -y
	Write-Output "Installing Spotify"
	choco install spotify -y
	Write-Output "Installing NordVPN"
	choco install nordvpn -y
	Write-Output "Installing Windows Terminal"
	choco install microsoft-windows-terminal -y
	Write-Output "Installing ImageGlass"
	choco install imageglass -y
	Write-Output "Customizing Taskbar"
	choco install taskbar-winconfig --params "'/LOCATION:bottom /INK:no /LOCKED:yes /CORTANA:no /KEYBOARD:no /STORE:no /TASKVIEW:no /PEOPLE:no /AUTOTRAY:no /USEPOWERSHELL:yes'" -y 
