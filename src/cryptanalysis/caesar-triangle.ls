require! ['../ciphers/caesar', '../utils/set']
require! '../utils/combinatorics'.combinations
require! '../utils/string'.letters

module.exports = class CaesarTriangle
	cipher = new caesar

	crack: (analyzer, cipherText) ~>
		@chooseKey @candidateKeys analyzer, cipherText

	chooseKey: ([least, top]) ~>
		inter = set.intersection least, top
		if empty inter
			union = set.union least, top
			if empty union then '?' else head union
		else
			head inter

	candidateKeys: (analyzer, cipherText) ~>
		ctr = analyzer.counter cipherText
		[@triangleKeys ctr, (analyzer.leastLetters ctr, 6), (analyzer.leastLangLetters 3)] +++ [
			@triangleKeys ctr, (analyzer.topLetters ctr, 6), (analyzer.topLangLetters 3)]

	triangleKeys: (counter, textLetters, langLetters) ~>
		map (~> @determineKey langLetters, it), @findTriangle langLetters, textLetters

	findTriangle: (langLetters, textLetters) ~>
		distances = @computeDistances langLetters
		[join '' c for c in combinations textLetters, 3 | (@computeDistances c) === distances]

	computeDistances: (letters) ~>
		sort [@letterDistance x for x in combinations letters, 2]

	letterDistance: ([a, b]) ~>
		distance = a.charCodeAt! - b.charCodeAt! |> abs
		distance = 26 - distance if distance > 13
		distance

	determineKey: (langLetters, comb) ~>
		comb = sort comb.split ''
		(find (~> (cipher.encrypt langLetters, it |> sort) === comb), letters) or '?'