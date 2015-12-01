getInts = do
    l <- getLine
    return $ map (\x -> read x :: Int) $ words l
