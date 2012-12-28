require! '../utils/string'.letters

module.exports = class TextAnalyzer
	(jsonDataStats) ~> 
		@stats = jsonDataStats

	mostMeaningful: (texts) ~>
		[[key, (@similarity text) - (key.length / 100000)] for key, text of texts] 
		|> sortBy (compare last) |> last |> head

	similarity: (text) ~> 
		(@simIndex text, 1, @stats.letters) + (@simIndex text, 2, @stats.bigrams)

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