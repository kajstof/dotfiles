; Remap hotkeys
CapsLock::Esc
Esc::CapsLock

; Global hotkeys
#n::Run, explorer.exe \\wsl$\Ubuntu\home\ksf\
#t::Run, %UserProfile%\AppData\Local\Microsoft\WindowsApps\wt.exe
#+t::Run, *RunAs %UserProfile%\AppData\Local\Microsoft\WindowsApps\wt.exe
#w::Run chrome.exe
#+w::Run chrome.exe -incognito
