require! [\../ciphers/vigenere \../cryptanalysis/caesar-triangle]

module.exports = class VigenereBrute
	maxKeyLen = 10
	vigDecrypt = (new vigenere).decrypt
	caesarCracker = (new caesarTriangle).crack

	crack: (analyzer, cipherText) ~>
		res = [2 to maxKeyLen] 
		|> map (~> concatMap (caesarCracker analyzer, _), @splitText cipherText, it)
		|> map (~> [it, vigDecrypt cipherText, it])
		|> listToObj 
		|> analyzer.mostMeaningful

	splitText: (text, keylen) ~>
		[til keylen] |> map (~> [text[i] for i in [it til text.length by keylen]] * '')