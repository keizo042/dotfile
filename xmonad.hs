import XMonad -- main
import XMonad.Hooks.ICCCMFocus  -- for android-studio visual
import XMonad.Hooks.DynamicLog -- for xmobar
import XMonad.Actions.SpawnOn(spawnOn) -- auto execute some
import System.IO (hPutStrLn) -- for dynamiclog
import qualified Data.Map as M

myStartUp = do
    spawnOn "1" "terminator"

myLogHook  = do
    takeTopFocus
    dynamicLog
--    dynamicLogWithPP $  defaultPP {ppOutput = hPutStrLn h}

workspaceName :: [String]
workspaceName = ["1","2","3","4","5","6","7","8","9"]

cfg = defaultConfig

main = do
    xmonad  =<< xmobar cfg
    where
	    { terminal = "terminator"
	    , workspaces = workspaceName
	    , startupHook = myStartUp
            , logHook =  myLogHook
	    , borderWidth = 2
	    }
