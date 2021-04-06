; Remap hotkeys
; CapsLock::Esc
; Esc::CapsLock

; Global hotkeys
#n::Run, explorer.exe \\wsl$\Ubuntu\home\ksf\

#t::
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

; #w::Run chrome.exe
; #+w::Run chrome.exe -incognito
