$trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30
$path = "$Env:userprofile\dotfiles\autohotkey\hotkeys_as_admin.ps1"
Write $path
Register-ScheduledJob -Trigger $trigger -FilePath $path -Name AutoHotKeyJob