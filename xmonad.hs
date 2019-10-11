import XMonad
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
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
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

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

main = xmonad $ gnomeConfig 
    { focusedBorderColor = "#fdf6e3" 
    , normalBorderColor =  "#002b36"
--    , layoutHook = smartBorders $ layoutHook gnomeConfig
    , layoutHook = smartBorders $ myLayout
    }
