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

~LAlt::
	Loop {
		If(GetKeyState(FireModeButton, "T")) {
			CalculatedFireDelay := MinFireDelay
		} Else {
			CalculatedFireDelay := (NominalFireDelay * CurrentFireDelay) + MinFireDelay
		}
		If(GetKeyState(OverrideButton, "P") || GetKeyState(SafetyButton, "T")) {
			ToolTip % CalculatedFireDelay
			If(GetKeyState(TriggerButton, "P")) {
				Send, {Click}
				CurrentFireDelay := CurrentFireDelay * FireDelayCurve
				Sleep % CalculatedFireDelay
			} Else {
				CurrentFireDelay := 1
			}
		} Else {
			ToolTip
		}
		Sleep % Clock
	}
