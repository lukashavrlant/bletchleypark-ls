require! TextAnalyzer:'./text-analyzer'
require! Caesar:'../ciphers/caesar'

module.exports = class CaesarBrute
	letters = \abcdefghijklmnopqrstuvwxyz
	caesar = new Caesar

	crack: (cipherText, analyzer) ~~>
		analyzer.mostMeaningful {[lett, caesar.decrypt cipherText, lett] for lett in letters}