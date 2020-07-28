import XMonad
import XMonad.Util.EZConfig
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.ResizableTile

myManageHook = composeAll
  [ stringProperty "WM_WINDOW_ROLE" =? "PictureInPicture" --> doIgnore
  , className =? "TelegramDesktop" --> doShift "7" ]

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
        , ((0, xK_Print),                      spawn "maim | tee ~/pics/screenshots/$(date +%s).png | xclip -selection clipboard -t image/png")
        , ((mod4Mask, xK_m),                   spawn "maim -s -u | xclip -selection clipboard -t image/png -i")
        , ((mod4Mask, xK_x),                   spawn "slock")

        -- Layout bindings
        , ((mod4Mask, xK_b), sendMessage ToggleStruts)
        , ((mod4Mask, xK_i), sendMessage MirrorShrink)
        , ((mod4Mask, xK_o), sendMessage MirrorExpand)
        ]
