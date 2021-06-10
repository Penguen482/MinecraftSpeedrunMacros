;
; Minecraft Reset Script v1.1
; Author:   onvo
;

; Script Function:
;  The following only apply inside the Minecraft window:
;   1) When on the title screen, the "Y" key will create a world on Easy
;   2) After loading in the world, "Y" will exit the world and then auto create another world on Easy 2483313382402348964
;   3) To just exit the world and not auto create world, press "U" on keyboard.
;   4) To change the "Y" and "U", change the keys before the double colon "::" and reload the script


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
   send {Tab}{Enter}{Tab}{Tab}{Tab}{Enter}{Tab}{Tab}{Enter}{Enter}{Enter}{Tab}{Tab}{Tab}{Tab}{Enter}{Tab}{Tab}{Tab}{2}{4}{8}{3}{3}{1}{3}{3}{8}{2}{4}{0}{2}{3}{4}{8}{9}{6}{4}{Enter}
}
ExitWorld()
{
   send {Esc}+{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Enter} 
}

#IfWinActive, Minecraft
{
F7::
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
