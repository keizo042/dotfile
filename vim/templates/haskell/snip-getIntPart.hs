
getIntTupple = do
    l <- getLine
    (f:s:_) = map (\x -> read x :: Int) $ words l
    (f,s)


