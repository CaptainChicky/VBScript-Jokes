Option Explicit

' ========================================
' HELPER FUNCTIONS
' ========================================

' Show message box with random delay before
Function ShowBox(message, title, buttons)
    RandomDelay()
    ShowBox = MsgBox(message, buttons, title)
End Function

' Random delay between 500-1500ms for suspense
Sub RandomDelay()
    Randomize
    Dim delay
    delay = Int((1500 - 500 + 1) * Rnd + 500)
    WScript.Sleep delay
End Sub

' Infinite trap loop
Sub TrapLoop(message, title)
    Do While True
        RandomDelay()
        MsgBox message, vbOKOnly + vbCritical, title
    Loop
End Sub

' Escalating trap - delays get longer each loop
Sub EscalatingTrap(baseMessage, title)
    Dim delayMs, count
    delayMs = 500
    count = 1
    
    Do While True
        MsgBox baseMessage & " (Error #" & count & ")", vbOKOnly + vbCritical, title
        WScript.Sleep delayMs
        
        ' Increase delay each time (max 5 seconds)
        If delayMs < 5000 Then
            delayMs = delayMs + 300
        End If
        count = count + 1
    Loop
End Sub

' ========================================
' MAIN SCRIPT FLOW
' ========================================

Sub Main()
    If ShowBox("Error while opening, do you want to fix the problem?", "Notice", vbYesNo + vbQuestion) = vbYes Then
        HandleScanPath()
    Else
        ShowBox "Aborted.", "Process Unable to be Completed", vbOKOnly + vbCritical
    End If
End Sub

' ========================================
' PATH 1: SCAN
' ========================================

Sub HandleScanPath()
    Dim result
    result = ShowBox("Unable to fix the issue. Do you want to scan your Computer?", "Computer Scan", vbYesNoCancel + vbExclamation)
    
    Select Case result
        Case vbYes
            HandleVirusDetection()
        Case vbNo
            ShowBox "The scan has been aborted.", "Notice", vbOKOnly + vbCritical
        Case vbCancel
            ' TRAP: Tried to cancel scan
            TrapLoop "Cannot cancel system scan.", "Access Denied"
    End Select
End Sub

' ========================================
' PATH 2: VIRUS DETECTION
' ========================================

Sub HandleVirusDetection()
    Dim result
    result = ShowBox("Alert! Virus has been detected. Do you want to delete this virus?", "Alert", vbYesNoCancel + vbCritical)
    
    Select Case result
        Case vbYes
            HandleDeletionAttempt()
        Case vbNo
            ShowBox "The virus has been ignored.", "Notice", vbOKOnly + vbCritical
            RandomDelay()
            ' Give them a warning then trap
            ShowBox "WARNING: Ignoring viruses is dangerous!", "Security Alert", vbOKOnly + vbExclamation
            EscalatingTrap "Virus is spreading through your system", "Critical Warning"
        Case vbCancel
            ' TRAP: Tried to cancel virus detection
            TrapLoop "You cannot cancel the virus scan.", "Fatal Error"
    End Select
End Sub

' ========================================
' PATH 3: DELETION ATTEMPT
' ========================================

Sub HandleDeletionAttempt()
    Dim result
    result = ShowBox("Unable to delete this virus.", "Critical Error", vbOKCancel + vbQuestion)
    
    If result = vbOk Then
        HandleVirusActivation()
    Else
        ShowBox "Virus has damaged critical files. Immediate action is needed.", "Virus Alert", vbOKOnly + vbCritical
        ' They cancelled - give them false hope then trap
        RandomDelay()
        ShowBox "Attempting automatic repair...", "System Repair", vbOKOnly + vbInformation
        RandomDelay()
        TrapLoop "Repair failed. System compromised.", "Fatal Error"
    End If
End Sub

' ========================================
' PATH 4: VIRUS ACTIVATION
' ========================================

Sub HandleVirusActivation()
    Dim result
    result = ShowBox("Virus is Activated", "Virus Alert", vbAbortRetryIgnore + vbCritical)
    
    Select Case result
        Case vbAbort
            HandleDeletionSequence()
        Case vbRetry
            ' Retry just loops them back
            ShowBox "Unable to retry virus deletion.", "Error", vbOKOnly + vbCritical
            RandomDelay()
            ShowBox "Virus has taken control.", "System Compromised", vbOKOnly + vbCritical
            EscalatingTrap "Access denied. System locked", "Fatal Error"
        Case vbIgnore
            ' They ignored it - BIG MISTAKE
            ShowBox "The virus has been ignored.", "Ignored", vbOKOnly + vbCritical
            RandomDelay()
            SpamThenTrap()
    End Select
End Sub

' ========================================
' PATH 5: DELETION SEQUENCE
' ========================================

Sub HandleDeletionSequence()
    Dim result
    
    ' File deletion warning
    result = ShowBox("Deleting System Files...", "File Deletion", vbAbortRetryIgnore + vbCritical)
    
    Select Case result
        Case vbAbort
            HandlePasswordTheft()
        Case vbRetry
            ShowBox "Unable to retry.", "Error", vbOKOnly + vbCritical
            EscalatingTrap "System files corrupted", "Critical Error"
        Case vbIgnore
            ShowBox "Personal information stolen. Immediate action is required.", "Alert", vbOKOnly + vbCritical
            TrapLoop "Data breach in progress. Cannot stop.", "Security Alert"
    End Select
End Sub

' ========================================
' PATH 6: PASSWORD THEFT
' ========================================

Sub HandlePasswordTheft()
    Dim result
    
    result = ShowBox("Virus is copying your password...", "Virus Alert", vbAbortRetryIgnore + vbExclamation)
    
    Select Case result
        Case vbAbort
            HandleFileTransfer()
        Case vbRetry
            ShowBox "Unable to stop password theft.", "Error", vbOKOnly + vbCritical
            TrapLoop "Credentials compromised. System locked.", "Security Breach"
        Case vbIgnore
            ShowBox "All passwords have been stolen.", "Alert", vbOKOnly + vbCritical
            EscalatingTrap "Identity theft in progress", "Critical Alert"
    End Select
End Sub

' ========================================
' PATH 7: FILE TRANSFER
' ========================================

Sub HandleFileTransfer()
    Dim stopTransfer, completionResult
    
    stopTransfer = ShowBox("Please wait. Uploading your files to database. Do you want to stop it?", "Transfer", vbYesNo + vbQuestion)
    
    ' Can't stop it either way
    If stopTransfer = vbYes Then
        ' Show fake progress
        ShowFakeProgress()
        completionResult = ShowBox("Can not stop. File transfer Completed", "Completed", vbOKCancel + vbCritical)
    Else
        ShowBox "File transfer pending...", "Transfering", vbOKOnly + vbCritical
        ' Show fake progress
        ShowFakeProgress()
        completionResult = ShowBox("File transfer Completed", "Completed", vbOKCancel + vbCritical)
    End If
    
    If completionResult = vbCancel Then
        ShowBox "Unable to cancel after completion.", "Error", vbOKOnly + vbCritical
    End If
    
    ' Final sequence
    ShowHackedSequence()
End Sub

' ========================================
' PATH 8: FINAL HACKED SEQUENCE
' ========================================

Sub ShowHackedSequence()
    Dim result, attempts
    attempts = 0
    
    Do
        RandomDelay()
        result = ShowBox("Your computer has been hacked.", "Hacked", vbRetryCancel + vbQuestion)
        
        If result = vbCancel Then
            attempts = attempts + 1
            RandomDelay()
            ShowBox "You cannot cancel.", "Error", vbOKCancel + vbCritical
            
            ' After 3 cancel attempts, trap them
            If attempts >= 3 Then
                EscalatingTrap "Stop trying to cancel. Your computer is ours now", "Fatal Error"
            End If
        Else
            Exit Do
        End If
    Loop
    
    ' Final messages
    RandomDelay()
    result = ShowBox("You can not access your Computer Anymore...", "Computer Hacked", vbOKCancel + vbExclamation)
    
    If result = vbOk Then
        RandomDelay()
        ShowBox "ono your pc ran :(", "VBScript go brrrrrrrrrrrrr", vbOKOnly + vbCritical
    Else
        ' They tried to cancel the final message - TRAP!
        TrapLoop "Unable to cancel. Your fate is sealed. your pc ran :(", "Error"
    End If
End Sub

' ========================================
' TRAP VARIATIONS
' ========================================

' Spam them with popups before infinite trap
Sub SpamThenTrap()
    Dim i
    For i = 1 To 15
        MsgBox "Warning: Virus spreading...", vbOKOnly + vbExclamation, "System Alert"
        WScript.Sleep 200
    Next
    TrapLoop "System completely compromised. All warnings ignored.", "Fatal Error"
End Sub

' Fake progress bar
Sub ShowFakeProgress()
    Dim i
    For i = 0 To 100 Step 10
        MsgBox "Uploading files... " & i & "%", vbOKOnly + vbInformation, "Please Wait"
        WScript.Sleep Int((800 - 300 + 1) * Rnd + 300) ' Random delay per step
    Next
End Sub

' ========================================
' START THE SCRIPT
' ========================================

Main()