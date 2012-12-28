require! './unittest'
require! [fs, path]
require! CaesarBrute:'../cryptanalysis/caesar-brute'
require! TextAnalyzer:'../cryptanalysis/text-analyzer'

langStats = fs.readFileSync "#__dirname/../../data/cs/stats.json" |> JSON.parse
analyzer = new TextAnalyzer langStats
brute = new CaesarBrute

eq \x brute.crack analyzer, \pqlgfjsbpqfkrpbabpqbkvkxwaibzemlsbpqkvzepjoqfwoxazrqxavqbahlkzfmlpibakfholhvalpmfkvpqlmbkvzegbelsfpqr
eq \q brute.crack analyzer, \aqptofejhurkzuijhecetaeburaofehqauln