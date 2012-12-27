require! TextAnalyzer:'../cryptanalysis/text-analyzer'
require! Caesar:'../ciphers/caesar'
normalize = require('../utils/string').normalizeString
require! '../utils/set'
combinations = require('../utils/combinatorics').combinations

module.exports = class CaesarTriangle
	caesar = new Caesar
	letters = \abcdefghijklmnopqrstuvwxyz

	crack: (analyzer, cipherText) ~>
		[least, top] = @candidateKeys analyzer, cipherText
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
		find (~> (caesar.encrypt langLetters, it |> sort) === comb), letters