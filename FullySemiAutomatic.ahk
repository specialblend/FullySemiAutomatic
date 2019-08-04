#SingleInstance Force
#InstallMouseHook

Clock := 10
MaxFireDelay := 300
MinFireDelay := 15
NominalFireDelay := MaxFireDelay - MinFireDelay
CurrentFireDelay := 1
FireDelayCurve := .8

TriggerButton := "LButton"
OverrideButton := "LAlt"
SafetyButton := "ScrollLock"
FireModeButton := "NumLock"
DebugModeButton := "CapsLock"

~LAlt::
	Loop {
		If(GetKeyState(DebugModeButton, "T")) {
			ToolTip % CalculatedFireDelay
		} Else {
			ToolTip
		}
		If(GetKeyState(FireModeButton, "T")) {
			CalculatedFireDelay := MinFireDelay
		} Else {
			CalculatedFireDelay := (NominalFireDelay * CurrentFireDelay) + MinFireDelay
		}
		If(GetKeyState(OverrideButton, "P") || GetKeyState(SafetyButton, "T")) {
			If(GetKeyState(TriggerButton, "P")) {
				Send, {Click}
				CurrentFireDelay := CurrentFireDelay * FireDelayCurve
				Sleep % CalculatedFireDelay
			} Else {
				CurrentFireDelay := 1
			}
		}
		Sleep % Clock
	}
