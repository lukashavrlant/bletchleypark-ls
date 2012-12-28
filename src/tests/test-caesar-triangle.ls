require! ['./unittest', '../cryptanalysis/caesar-triangle', '../cryptanalysis/text-analyzer']

cipherText = \sjefanxqduwjenijsyxpdpfsinifyofsknxhmjwajhyawyjpatknhnfqsnruwtmqfxjsnwjfltafqsffujqmjwhjytrfxjmfsfpfpyjwdojoadeafqfgdxjofptgdafqdhqjspxhsjzhmfejqauwnrjatqgjtutxymqfadxyfyzknxhmjweizwfesnqejrfstrnsfhntitghfszfefxjgtzptspwjysnadxqjipduwfhjaeifypfsinifyzwdxjsjmtiqfnuwtytejgdzatqsnqhjxyzuthmdgsdruwfpynpfrpyjwjxutozojxjwtzsjpijoxnmtuwjrnjwfrnqtxjejrfsf

langStats = {'letters' : {
	a:1, o:1, e:1,
	q:0, w:0, x:0
}}

analyzer = new textAnalyzer langStats
triangle = new caesarTriangle


eq \f triangle.crack analyzer, cipherText