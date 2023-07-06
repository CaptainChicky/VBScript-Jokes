$ShortcutFile = "Computer.lnk"
$IconFile = "%SystemRoot%\System32\SHELL32.dll"
$IconIndex = 15
$TargetPath = "Assets\Computer.cmd"  # Specify the relative path to the target file
$StartIn = "Assets\"  # Specify the relative "Start In" directory

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = (Join-Path $PSScriptRoot $TargetPath)  # Join the relative path with the script's root path
$Shortcut.IconLocation = $IconFile + "," + $IconIndex
$Shortcut.WorkingDirectory = (Join-Path $PSScriptRoot $StartIn)  # Join the relative "Start In" directory with the script's root path
$Shortcut.Save()