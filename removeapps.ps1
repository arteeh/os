get-appxpackage Microsoft.GetHelp | remove-appxpackage
get-appxpackage Microsoft.People | remove-appxpackage
get-appxpackage Microsoft.Wallet | remove-appxpackage
get-appxpackage Microsoft.Windows.Photos | remove-appxpackage
get-appxpackage Microsoft.WindowsAlarms | remove-appxpackage
get-appxpackage Microsoft.WindowsCamera | remove-appxpackage
get-appxpackage Microsoft.WindowsMaps | remove-appxpackage
get-appxpackage Microsoft.XboxGameCallableUI | remove-appxpackage
get-appxpackage Microsoft.XboxGameOverlay | remove-appxpackage
get-appxpackage Microsoft.XboxGamingOverlay | remove-appxpackage
get-appxpackage Microsoft.XboxIdentityProvider | remove-appxpackage
get-appxpackage Microsoft.XboxSpeechToTextOverlay | remove-appxpackage
get-appxpackage Microsoft.YourPhone | remove-appxpackage
get-appxpackage Microsoft.Messaging | remove-appxpackage

# Cortana app
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage

# Edge; currently doesn't work
get-appxpackage Microsoft.MicrosoftEdge | remove-appxpackage
get-appxpackage Microsoft.MicrosoftEdgeDevToolsClient | remove-appxpackage