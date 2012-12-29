require! '../utils/string'.letters
require! fs

module.exports = class TextAnalyzer
	(jsonDataStats) ~> 
		@stats = jsonDataStats

	wordsDir = '../../data/cs/words/'

	mostMeaningful: (texts) ~>
		[[key, (@similarity text) - (key.length / 100000)] for key, text of texts] 
		|> sortBy (compare last) |> last |> head

	similarity: (text) ~> 
		res = (@simIndex text, 1, @stats.letters) + (@simIndex text, 2, @stats.bigrams)
		wordsCount = 10 + @topWordsCount text
		res * (wordsCount / 10)

	simIndex: (text, n, stats) ~>
		@ngramsCounter text, n |> @deviation stats |> (1000/) |> (/n)

	splitText: (text, n) ~>
		[text.substring i, i+n for i in [to text.length - 1 by n]]

	ngramsCounter: (text, n) ~>
		@splitText text, n |> @counter |> @occurences 

	counter: (list) ~>
		count = {[k, 0] for k in letters}
		each (~> count[it]++), list
		count

	occurences: (counter) ~>
		s = sum values counter
		{[k, v / s] for k, v of counter}

	topLetters: (counter, n) ~>
		@leastLetters {[k, -v] for k, v of counter}, n

	leastLetters: (counter, n) ~>
		sortBy (compare last), [[k, v] for k, v of counter] |> take n |> map head

	topLangLetters: (n) ~>
		@topLetters @stats.letters, n

	leastLangLetters: (n) ~>
		@leastLetters @stats.letters, n

	deviation: (langOcc, textOcc) ~~>
		sum [abs ((textOcc[k] or 0) - v) for k, v of langOcc]

	words: (len) ~>
		fs.readFileSync "#wordsDir#len.dic" |> (.toString!) |> words

	topWordsCount: (text) ~> 
		map (@containsWord text, _), @stats.topwords |> sum

	containsWord: (text, word) ~~>
		[to text.length - word.length]
		|> map ((x) ~> if (text.substring x, x + word.length) == word then 1 else 0)
		|> sum