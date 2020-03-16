import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)

import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.SpawnOnce

myManageHook = composeAll
  [ stringProperty "WM_WINDOW_ROLE" =? "PictureInPicture" --> doIgnore ]

main = do
  xmonad $ ewmh $ docks $ defaultConfig {
          modMask               = mod4Mask
        , terminal              = "termite" 
        , focusedBorderColor    = "#665c54"
        , normalBorderColor     = "#000000"
        , borderWidth           = 1
        , manageHook            = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook            = smartSpacing 2 $ smartBorders $ noBorders Full ||| avoidStruts(ResizableTall 1 (1/100) (1/2) [])
         } `additionalKeys` [

	-- Apps and tools
          ((mod4Mask, xK_f),                   spawn "firefox")
	, ((mod4Mask, xK_d),                   spawn "goldendict")
	, ((mod4Mask, xK_v),                   spawn "pavucontrol")

        -- Special commands
        , ((mod4Mask, xK_End),                 spawn "poweroff")
	, ((mod4Mask .|. shiftMask, xK_End),   spawn "reboot")
        , ((0, xK_Print),                      spawn "scrot ~/Pictures/Screenshots/%Y-%m-%d-%T.png")
        , ((mod4Mask, xK_x),                   spawn "slock")

	-- Backlight
	, ((mod4Mask .|. shiftMask, xK_Right), spawn "xbacklight -set 100")
	, ((mod4Mask .|. shiftMask, xK_Left),  spawn "xbacklight -set 1")
	, ((mod4Mask,  xK_Right),              spawn "xbacklight -inc 10")
	, ((mod4Mask,  xK_Left),               spawn "xbacklight -dec 10")

        -- Layout bindings
        , ((mod4Mask, xK_b), sendMessage ToggleStruts)
        , ((mod4Mask, xK_i), sendMessage MirrorShrink)
        , ((mod4Mask, xK_o), sendMessage MirrorExpand)
        ]
