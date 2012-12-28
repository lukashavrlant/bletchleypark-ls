require! Vigenere:'../ciphers/vigenere'
require! Transposition:'../ciphers/transposition'
require! '../cryptanalysis/caesar-triangle'
require! fs
require! '../cryptanalysis/text-analyzer'

module.exports = class VigenereBrute
	maxKeyLen = 10
	vigenere = new Vigenere
	trans = new Transposition
	caesarCracker = (new caesarTriangle).crack

	crack: (analyzer, cipherText) ~>
		res = [2 to maxKeyLen] 
		|> map (~> concatMap (caesarCracker analyzer, _), @splitText cipherText, it)
		|> map (~> [it, vigenere.decrypt cipherText, it])
		|> listToObj 
		|> analyzer.mostMeaningful

	splitText: (text, keylen) ~>
		[til keylen] |> map (~> [text[i] for i in [it til text.length by keylen]] * '')