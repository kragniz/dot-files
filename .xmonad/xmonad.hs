import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
 
myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

myTerminal = "/usr/bin/urxvt"
 
main = do
    xmproc <- spawnPipe "xmobar $HOME/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , borderWidth = 1 
        , terminal = myTerminal
        , focusedBorderColor = "#d74b73"
        , normalBorderColor = "#3d3d3d"
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#d74b73" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Mod => Windows key
        } `additionalKeys`
        [((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
