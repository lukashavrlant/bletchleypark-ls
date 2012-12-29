require! Transposition:'../ciphers/transposition'
require! [fs, '../cryptanalysis/text-analyzer']
require! '../utils/set'
require! '../utils/string'.letters

module.exports = class TranspositionLong
	maxKeyLen = 7
	transposition = new Transposition

	crack: (analyzer, cipherText) ~>
		@findMatchWords analyzer, cipherText
		|> map (~> [it, transposition.decrypt cipherText, it])
		|> listToObj
		|> analyzer.mostMeaningful

	findMatchWords: (analyzer, cipherText) ~>
		keys = []
		for keylen in @keyLengths cipherText
			lenWords = analyzer.words keylen
			for cipherWord in transposition.splitDecText keylen, cipherText |> take 10
				langWords = filter (@matchCounter _, @counter cipherWord), lenWords
				keys = keys +++ concat map (~> @candidateKeys it, @positions cipherWord), langWords
		unique keys

	candidateKeys: (word, positions) ~~>
		results = []
		@candidateKeysHelper word, [], positions, results
		results

	candidateKeysHelper: (word, visited, positions, results) ~~>
		| word  => 	for free in set.diff positions[head word], visited
						@candidateKeysHelper (tail word), (visited +++ free), positions, results
		| _ 	=> map (~> letters[it]), visited |> join '' |> results.push

	keyLengths: (cipherText) ~>
		[x for x from 2 to maxKeyLen | cipherText.length % x == 0]

	matchCounter: (word, counter) ~>
		@counter word |> (===counter)

	counter: (word) ~>
		count = {}
		each (~> (count[it]++) or (count[it] = 1)), word
		count

	positions: (word) ~>
		occ = {}
		for x, i in word
			if occ[x]
				occ[x].push i
			else
				occ[x] = [i]
		occ