$autohotkeyPath = "C:\Program Files\AutoHotkey\AutoHotkey.exe"
$hotkeyAhkPath = "$Env:userprofile\dotfiles\autohotkey\hotkeys.ahk"
Start-Process $autohotkeyPath -verb runas $hotkeyAhkPath