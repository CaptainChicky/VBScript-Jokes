$ShortcutFile = "Run Me!.lnk"
$IconFile = Join-Path $PSScriptRoot "Data\viruzz.ico"  # Specify the relative path to the icon file
$TargetPath = "Data\Start.bat"  # Specify the relative path to the target file
$StartIn = "Data\"  # Specify the relative "Start In" directory

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = (Join-Path $PSScriptRoot $TargetPath)  # Join the relative path with the script's root path
$Shortcut.IconLocation = $IconFile
$Shortcut.WorkingDirectory = (Join-Path $PSScriptRoot $StartIn)  # Join the relative "Start In" directory with the script's root path
$Shortcut.Save()
