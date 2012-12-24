require! fs

module.exports = class TextAnalyzer
	(jsonData) ~> 
		@stats = jsonData

	mostMeaningful: (texts) ~>
		[[key, @similarity text] for key, text of texts] |> sortBy (compare last) |> last |> head


	similarity: (text) ~> 
		(@ngramsCounter text, 1 |> @deviation @stats.letters) +
		(@ngramsCounter text, 2 |> @deviation @stats.bigrams)

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
		dev = 0
		for k, v of langOcc
			dev += abs (textOcc[k] or 0 - v)
		1000 / dev