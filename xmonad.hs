import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns

myTerminal = "alacritty" :: String

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
    where
        tiled = Tall nmaster delta ratio
        threeCol = ThreeColMid nmaster delta ratio
        nmaster = 1
        ratio = 1 / 2
        delta = 3 / 100

main :: IO ()
main =
  xmonad $
    def
      { modMask = mod4Mask -- Rebind Mod to the Super key
      }
      `additionalKeysP` [ ("M-b", spawn "librewolf"),
                          ("M-<Return>", spawn myTerminal),
                          ("<Print>", unGrab *> spawn "screenshot -n full"),
                          ("M-S-w", kill)
                        ]
