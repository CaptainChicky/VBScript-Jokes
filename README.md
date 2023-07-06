# What is this?
This repo contains two small VBScript jokes, `/Notifications/` and `/No-Restart/`. They are meant to be small pranks that can be used to scare your friends. The `/Notifications/` one is *completely safe*, meaning that you can send this to your friends to scare or prank them without damaging anything (except possibly the mental state of the recieving end 😂), while the `/No-Restart/` one may cause some loss of unsaved work, because it forces your PC to restart. 

# Contents
## Notifications
This is located in the `/Notifications/` directory. Here's a file overview:
  1) `Create-lnk.ps1` - this is a PowerShell script that creates a shortcut to `/Assets/Computer.cmd`.
  2) `/Assets/Joke.vbs` - the actual file that opens the prank notifications.
  3) `/Assets/Computer.cmd` - this is a batchfile that opens `Joke.vbs`.

What you are supposed to do here, is that after you download this repo/repo dir onto your friend's PC, you run `Create-lnk.ps1`. If their powershell execution level is blocking this, set it up to "RemoteSigned" (or "Bypass", if it doesn't work) temporarily. Remember to change this execution level back after you are done running this script. This script will create a shortcut to `Computer.cmd` called `My PC.lnk` in the same directory as it. Then, hide the repo folder you downloaded, while replacing (you shouldn't delete it, just hide it somewhere, or make it a hidden file) your friend's `My PC.lnk` with the one you just created. When they open "My PC", they will be greeted with the VBScript prank. Again, this prank has nothing possibly destructive to it.

The VBScript is for this directory is written very noobishly, in a very large amount of nested 'if' functions with questionable variable names. There's not really any way to optimize it either that I know, so whatever.

## No-Restart
This is located in the `/No-Restart/` directory. Here's a file overview:
  1) `Create-lnk.ps1` - this is a PowerShell script that creates a shortcut to `/Data/Start.bad`.
  2) `/Data/Message.vbs` - the actual file types out the message that will be displayed to the and opens `Restart.bat`.
  3) `/Data/Start.bat` - this is a batchfile that opens notepad, and then `Message.vbs`.
  4) `/Data/Restart.bat` - this taskkills notepad and restarts the computer.

Again, you can run `Create-lnk.ps1` to create a shortcut called `Run Me!.lnk`, which links to `Start.bat`. You should have the correct execution level for powershell to run this script of course. The link file made here is questionable with an image that looks like a bug to make it look suspicious. I wasn't sure what I was thinking when I made this but whatever. Should your unwitting friend run it for some reason, it runs `Start.bat`, which opens notepad and then `Message.vbs`. The VBScript then types out a wacky message that ultimately tells them to not restart, but also opens `Restart.bat` after 5 seconds. `Restart.bat` then taskkills notepad and restarts the computer. This somehow seemed funny to me back in 2020, so bruh lmao. This prank is destructive, and may cause loss of unsaved work. Use with caution.

Should you look at the commit history, just note that the old VBScript is written very very badly, so I've upgraded it to a better one.

# Dependencies
Ideally you should run this on a powershell with version 5.1 or higher, as I haven't tested this with older versions. Command prompt and the Windows Script Host (wscript.exe or cscript.exe) should be present on the computer you are running this on. 

`/Notifications/` uses an icon within `%SystemRoot%\System32\SHELL32.dll`. This should be present on the computer.

`/No-Restart/` utilizes notepad and `shutdown.exe`. These should be present on the computer.

However, it's to be noted that all of these dependencies should literally be in a default installation of Windows 10 :)
