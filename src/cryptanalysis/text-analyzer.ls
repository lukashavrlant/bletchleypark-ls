require! fs

module.exports = class TextAnalyzer
	(jsonData) ~> 
		@stats = jsonData

	mostMeaningful: (texts) ~>
		[[key, @similarity text] for key, text of texts] |> sortBy (compare last) |> last |> head


	similarity: (text) ~> 
		(@simIndex text, 1, @stats.letters) + (@simIndex text, 2, @stats.bigrams)

	simIndex: (text, n, stats) ~>
		@ngramsCounter text, n |> @deviation stats |> (1000/) |> (/n)

	splitText: (text, n) ~>
		[text.substring i, i+n for i in [to text.length - 1 by n]]

	ngramsCounter: (text, n) ~>
		@splitText text, n |> @counter |> @occurences 

	counter: (list) ~>
		count = {}
		each (~> count[it]++ or count[it] = 1), list
		count

	occurences: (counter) ~>
		s = sum values counter
		{[k, v / s] for k, v of counter}

	deviation: (langOcc, textOcc) ~~>
		sum [abs ((textOcc[k] or 0) - v) for k, v of langOcc]