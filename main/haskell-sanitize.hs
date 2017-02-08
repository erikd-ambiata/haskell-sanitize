import Foreign.C.Types

main :: IO ()
main = do
  test_safe_call
  print $ dodgy_addition 8 5


foreign import ccall unsafe
  dodgy_addition :: CInt -> CInt -> CInt

foreign import ccall safe
  test_safe_call :: IO ()
