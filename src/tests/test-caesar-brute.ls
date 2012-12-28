require! ['./unittest', fs, '../cryptanalysis/caesar-brute', '../cryptanalysis/text-analyzer']

langStats = fs.readFileSync "#__dirname/../../data/cs/stats.json" |> JSON.parse
analyzer = new textAnalyzer langStats
brute = new caesarBrute

cipherText = \sjefanxqduwjenijsyxpdpfsinifyofsknxhmjwajhyawyjpatknhnfqsnruwtmqfxjsnwjfltafqsffujqmjwhjytrfxjmfsfpfpyjwdojoadeafqfgdxjofptgdafqdhqjspxhsjzhmfejqauwnrjatqgjtutxymqfadxyfyzknxhmjweizwfesnqejrfstrnsfhntitghfszfefxjgtzptspwjysnadxqjipduwfhjaeifypfsinifyzwdxjsjmtiqfnuwtytejgdzatqsnqhjxyzuthmdgsdruwfpynpfrpyjwjxutozojxjwtzsjpijoxnmtuwjrnjwfrnqtxjejrfsf

eq \f brute.crack analyzer, cipherText