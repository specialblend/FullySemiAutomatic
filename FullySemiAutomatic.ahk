#SingleInstance Force
#InstallMouseHook

RapidFireDelay:= 50

WheelLeft::
	RapidFireDelay++
Return

WheelRight::
	If(RapidFireDelay > 0) {
		RapidFireDelay--
	}
Return

LAlt::
	Loop {
		If(GetKeyState("LAlt", "P")) {
			ToolTip % RapidFireDelay
			If(GetKeyState("LButton", "P")) {
				Send, {Click}
			}
		} Else {
			ToolTip
		}
		Sleep % RapidFireDelay
	}
