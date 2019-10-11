import XMonad
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.Spiral
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Fullscreen
import XMonad.Layout.SimpleFloat
import XMonad.Config.Gnome
import XMonad.Config.Desktop
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import System.IO
import XMonad.Layout.IndependentScreens

myLayout = avoidStruts (
    Tall 1 (3/100) (1/2) |||
    spiral (6/7)) |||
    noBorders (fullscreenFull Full)

tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#586e75",
    activeColor = "#fdf6e3",
    inactiveBorderColor = "#00000",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#002b36"
}

conf =  gnomeConfig 
    { focusedBorderColor = "#fdf6e3" 
--    , startupHook = setWMName "LG3D"
    , normalBorderColor =  "#002b36"
    , workspaces = withScreens 2 ["0", "1", "2", "3", "4", "5", "6"]
    , layoutHook = smartBorders $ myLayout
    } `additionalKeys` myKeys

myKeys = 
    [((m .|. mod1Mask, k), windows $ onCurrentScreen f i)
    | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
    , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]
    ++
    [((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,0,2]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]

main = xmonad conf