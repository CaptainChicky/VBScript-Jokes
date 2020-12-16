# What is the VBScript notifications joke?
This is a little computer virus joke made from notifications via VBScript. This is *completely safe*, meaning that you can send this to your less computer-able friends to scare or prank them without damaging anything(except possibly the mental state of the recieving end 😂).
*Note*: A suggestion of how to do this is to download the files to their desktop, give the "Assets" folder the hidden attribute, and replace/add the their genuine "My PC.lnk" shortcut with the "My PC.lnk" supplied here(most likely has the same icon, so looks genuine but actually opens the batch file which opens the .vbs file). Of course, always remember to mark the files as "trusted" first, or else Windows Defender will block if it is openned.

# What this repository contains...
This repository contains the "Assets" folder, containing:
  1) "Joke.vbs", the actual file that opens the prank notifications.
  2) "Computer.cmd", the batch file which when ran will open "Joke.vbs". I know this is unnessesary. I included it for the effect where a black window that will open and dissapear quickly, making it seem as if there is actual malware on one's system.
  3) "computer.ico", the thumbnail asset of the "My PC.lnk" shortcut. If the supplied icon is different from the being pranked end's icon, then the pranker can change it, and relink that icon with a relative local link(./Assets/new-icon.ico) to the "My PC.lnk" shortcut.

This repository also contains "My PC.lnk", which is the replacement shortcut for the being pranked end's genuine "My PC.lnk". It has the icon from the path "./Assets/computer.ico". One can change the icon if they want. The shortcut opens "Computer.cmd", which opens "Joke.vbs".

*Disclaimer*: The VBScript is written very noobishly, in a very large amount of looped 'if' functions. Somebody can optimize this by creating an array of the statements and implementing that in some way ¯\\\_(ツ)\_/¯. If you try to insult me or nag me about how bad I am at VBScript then idc, so go away if you're that person 🤡.

# Requirements to use...
This program uses MS-DOS batch programming, along with Visual Basic. On a said computer, the Windows Command Prompt(cmd.exe) must be present, along with wscript.exe or cscript.exe to run the Visual Basic.

<sub>which is literally every default windows installation xD shush<sub>
  
 **🥰 No disclaimer this time since nothing is dangerous 🤩**
