module Sanitize.Dodgy where

import Foreign.C.Types

dodgy :: Int -> Int -> Int
dodgy x y = fromIntegral $ dodgy_addition (fromIntegral x) (fromIntegral y)


foreign import ccall unsafe
  dodgy_addition :: CInt -> CInt -> CInt
