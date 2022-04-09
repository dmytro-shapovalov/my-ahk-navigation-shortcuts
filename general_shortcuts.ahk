; REMOVED: #NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode("Input") ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir) ; Ensures a consistent starting directory.
#SingleInstance force

SetCapsLockState("AlwaysOff")

/*
| Shortcut                         | Output                           |
| -------------------------------- | -------------------------------- |
| CAPSLOCK + { i, j, k, l }        | { Up, Left, Down, Right }        |
| CAPSLOCK + { u, o }              | { Home, End }                    |
| CAPSLOCK + { y, h }              | { PageUp, PageDown }             |
| CAPSLOCK + { Backspace }         | { Delete }                       |
*/

SC03a & Tab::PrintScreen

SC03a & Space::#Space

SC03a & i::Up
SC03a & k::Down
SC03a & j::Left
SC03a & l::Right

SC03a & u::Home
SC03a & o::End

SC03a & y::PgUp
SC03a & h::PgDn

SC03a & Backspace::Delete

SC03a & p::^Left ; Go one word back
SC03a & VK0xBA::^Right ; Go one word forward

SC03a & Enter::AppsKey ; Show context menu at the cursor

SC03a & Esc::WinClose("A")

VK0xE2::Shift ; Remap sliced shift key back to shift

:o:"""::@
:o:---::—

SC03a::
    { ; V1toV2: Added bracket
        If (A_PriorHotKey = A_ThisHotkey and A_TimeSincePriorHotkey < 210 and GetKeyState("SC03a", "T") = 0)
            SetCapsLockState("AlwaysOn")
        else If (A_PriorHotKey = A_ThisHotkey and A_TimeSincePriorHotkey < 210 and GetKeyState("SC03a", "T") = 1)
            SetCapsLockState("AlwaysOff") ; Use double push to use capsLock.
        return

        ; SC03a & <::#^Left ; Switch windows desktop backwards
        ; SC03a & >::#^Right ; Switch windows desktop forwards

        ; for amazonWorkspaces
    } ; V1toV2: Added Bracket before hotkey or Hotstring
F14::
SC03a & SC033::
    { ; V1toV2: Added bracket
        if (WinActive("Amazon WorkSpaces")) {
            help := Gui()
            help.Add("Text")
            help.Show()
            Send("#^{Left}")
            Sleep(100)
            help.Destroy()
        } else {
            Send("#^{Left}")
        }
        return ; Switch windows desktop backwards
    } ; V1toV2: Added Bracket before hotkey or Hotstring

F15::
SC03a & SC034::
    { ; V1toV2: Added bracket
        if (WinActive("Amazon WorkSpaces")) {
            help := Gui()
            help.Add("Text")
            help.Show()
            Send("#^{Right}")
            Sleep(100)
            help.Destroy()
        } else {
            Send("#^{Right}")
        }
        return ; Switch windows desktop forwards
    } ; V1toV2: Added bracket in the end
