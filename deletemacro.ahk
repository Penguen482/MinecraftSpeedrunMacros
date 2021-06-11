;
; Minecraft Reset Script v1.1
; Author:   Penguen482
; this macro quickly deletes worlds in game with a single click, don't worry about it deleting all the worlds in your folder. Its a bit faster then manually removing them. Use this if you are too lazy to use file explorer to delete worlds.



#NoEnv
SetWorkingDir %A_ScriptDir%

DELAY = 1 ; Set this to 0 for no delay, set this to 1 for delay between key presses
if DELAY
   SetKeyDelay , 1 ; Change this value to increase delay between key presses
else {
   SendMode Input
}


CreateWorld()
{
   send  {tab}{tab}{tab}{tab}{tab}{Enter}{tab}{Enter}
}
ExitWorld()
{
   send {Esc}+{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Enter} 
}

#IfWinActive, Minecraft
{
K::
   WinGetPos, X, Y, W, H, Minecraft
   WinGetActiveTitle, Title
   IfNotInString Title, player
      CreateWorld()
   else {
      ExitWorld()
      Loop {
         IfWinActive, Minecraft 
         {
            PixelSearch, Px, Py, 0, 0, W, H, 0x00FCFC, 1, Fast
            if (!ErrorLevel) {
               Sleep, 100
               IfWinActive, Minecraft 
               {
                  CreateWorld()
                  break
               }
            }
         }
      } 
   } 
return

F6::
   ExitWorld()
return

::
   WinGetActiveTitle, Title
   IfNotInString Title, player
   {
      IfWinActive, Minecraft
      {
         CreateWorld()
      }
   }
return
}
