; WARNING: Programs that use User32\LockWorkStation (i.e. programmatically locking the operating system) may not work correctly! 
; This includes Windows itself (i.e. using start menu or task manager to lock will also not work).
; Script changes Win-L to show a msgbox and Ctrl-Alt-L to lock windows

; The following 3 code lines are auto-executed upon script run, the return line marks an end to the auto-executed code section.
; Register user defined subroutine 'OnExitSub' to be executed when this script is terminating
  OnExit, OnExitSub

  ; Disable LockWorkStation, so Windows doesn't intercept Win+L and this script can act on that key combination 
  SetDisableLockWorkstationRegKeyValue( 1 )
return

OnExitSub:
  ; Enable LockWorkStation, because this script is ending (so other applications aren't further disturbed)
  SetDisableLockWorkstationRegKeyValue( 0 )
  ExitApp
return

SetDisableLockWorkstationRegKeyValue(value) {
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, %value%
}

; --- Shortcuts ---
; #If getkeystate("lwin")
#h::send {LWinUp}{Left}
#k::send {LWinUp}{Up}
#j::send {LWinUp}{Down}
#l::send {LWinUp}{Right}
; #If

^!l::
  ; Ctrl-Alt-L 
  ; Temporary enable locking
  SetDisableLockWorkstationRegKeyValue( 0 )
  ; Lock
  DllCall( "User32\LockWorkStation" )
  ; Disable locking again 
  SetDisableLockWorkstationRegKeyValue( 1 )
return

#;::
  MsgBox, Win-Semicolon was pressed!
return
  

; --- General shortcuts ---
; CapsLock::Esc
; Esc::CapsLock
#n::Run, explorer.exe \\wsl$\Ubuntu\home\ksf\
; #w::Run chrome.exe
; #+w::Run chrome.exe -incognito

; --- Windows Terminal ---
#`::
  If WinExist("ahk_exe WindowsTerminal.exe") {
    If WinActive("ahk_exe WindowsTerminal.exe") {
      WinMinimize, % "ahk_exe WindowsTerminal.exe"
      return
    }

    WinActivate, % "ahk_exe WindowsTerminal.exe"
  }
  Else {
    Run, *RunAs %UserProfile%\AppData\Local\Microsoft\WindowsApps\wt.exe
  }