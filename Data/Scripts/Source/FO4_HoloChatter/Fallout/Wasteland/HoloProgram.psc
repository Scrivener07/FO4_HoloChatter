Scriptname Fallout:Wasteland:HoloProgram extends ObjectReference
import Papyrus
import Papyrus:Diagnostics:Log


UserLog Log

string DataToken = "DataToken" const
ObjectReference LastTerminal



; Initialize
;---------------------------------------------

Event OnInit()
	Log = new UserLog
	Log.Caller = self
	Log.FileName = Context.Title
EndEvent


; Holotapes
;---------------------------------------------

Event OnHolotapePlay(ObjectReference akTerminalRef)
	Writeline(Log, "OnHolotapePlay(akTerminalRef="+akTerminalRef+")")

	If (akTerminalRef)
		LastTerminal = akTerminalRef
	EndIf

	; Message equals "banana.png"

	LastTerminal.AddTextReplacementData(DataToken, Wasteland_HoloProgramMessage)
	Writeline(Log, "Sent the message '"+ Wasteland_HoloProgramMessage + "' to HoloProgram.as")
EndEvent


Event OnHolotapeChatter(string asChatter, float afNumericData)
	; Event that occurs when a flash program on a holotape wants to communicate with script.
	Writeline(Log, "________________________")
	Writeline(Log, "| HOLOTAPE LISTENER")
	Writeline(Log, "|   Received Chatter")
	Writeline(Log, "|   Chatter: "+asChatter)
	Writeline(Log, "|   Numeric: "+afNumericData)
	Writeline(Log, "________________________")
EndEvent


; Properties
;---------------------------------------------

Group Properties
	Project:Context Property Context Auto Const Mandatory
	Message Property Wasteland_HoloProgramMessage Auto Const Mandatory
EndGroup
