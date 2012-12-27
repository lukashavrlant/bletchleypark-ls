require! TextAnalyzer:'./text-analyzer'
require! Caesar:'../ciphers/caesar'

module.exports = class CaesarBrute
	letters = \abcdefghijklmnopqrstuvwxyz
	caesar = new Caesar

	crack: (analyzer, cipherText) ~~>
		analyzer.mostMeaningful {[lett, caesar.decrypt cipherText, lett] for lett in letters}