# define installer name
OutFile "MqttPluginInstaller_UE5.2.exe"


 
# default section start
Section "Install MqttPluginInstaller_UE5.2"
	
	SetRegView 64
	Var /GLOBAL UE5_DIR
	ReadRegStr $UE5_DIR HKLM "Software\EpicGames\Unreal Engine\5.2" "InstalledDirectory"
	#!define INSTDIR $1\Engine\Plugins\Marketplace\SimulatorInterface
	# define output path
	#SetOutPath $INSTDIR 
	#Var /GLOBAL PLUGINDIR
	
	StrCpy $INSTDIR $UE5_DIR\Engine\Plugins\Marketplace\MqttPlugin
	
	#InstallDirRegKey HKLM "Software\EpicGames\Unreal Engine\5.2" "InstalledDirectory" #previous path (will override default value)
	SetOutPath $INSTDIR
	
	# specify file to go in output path for EngHub Client
	File /r "MqttPlugin_5.2\*"
	

 
	; Write the installation path into the registry
	WriteRegStr HKLM SOFTWARE\MqttPlugin_UE52 "Install_Dir" "$INSTDIR"
	; Write the uninstall keys for Windows
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MqttPlugin_UE52" "DisplayName" "EngineeringHubNG"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MqttPlugin_UE52" "UninstallString" '"$INSTDIR\uninstall.exe"'
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MqttPlugin_UE52" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MqttPlugin_UE52" "NoRepair" 1
	WriteUninstaller "$INSTDIR\uninstall.exe"

	 
 
#-------
# default section end
SectionEnd
 
# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"
 

	RMDir /r $INSTDIR
	
	; Remove registry keys
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MqttPluginInstaller_UE5.2"
	DeleteRegKey HKLM SOFTWARE\MqttPluginInstaller_UE5.2

	

 
SectionEnd