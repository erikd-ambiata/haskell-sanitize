import Foreign.C.Types

main :: IO ()
main = do
  __asan_init
  test_safe_call
  print $ dodgy_addition 1000 1065


foreign import ccall unsafe
  dodgy_addition :: CInt -> CInt -> CInt


foreign import ccall safe
  __asan_init :: IO ()

foreign import ccall safe
  test_safe_call :: IO ()
