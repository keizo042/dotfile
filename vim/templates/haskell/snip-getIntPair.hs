getIntTupple = do
    l <- getLine
    let (f:s:_) = map (\x -> read x :: Int) $ words l
    return (f,s)


