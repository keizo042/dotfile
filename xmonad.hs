import qualified Data.Map                  as M
import           System.IO                 (hPutStrLn)
import           XMonad
import           XMonad.Actions.SpawnOn    (spawnOn)
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.FadeWindows
import           XMonad.Hooks.FadeInactive
import           XMonad.Hooks.ICCCMFocus

myStartUp = do
    spawnOn "1" "terminator"


myFadeHook = composeAll [ opaque ]

myLogHook  = do
    fadeWindowsLogHook myFadeHook
    fadeInactiveLogHook 0xdfffffff
    takeTopFocus
    dynamicLog
--    dynamicLogWithPP $  defaultPP {ppOutput = hPutStrLn h}

workspaceName :: [String]
workspaceName = ["1","2","3","4","5","6","7","8","9"]


main = do
    xmonad  =<< xmobar defaultConfig
              { terminal = "terminator"
              , workspaces = workspaceName
              , startupHook = myStartUp
              , handleEventHook = fadeWindowsEventHook
              , logHook =  myLogHook
              , borderWidth = 2
              }
