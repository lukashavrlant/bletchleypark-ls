require! Caesar:'../ciphers/caesar'
require! '../utils/string'.letters

module.exports = class CaesarBrute
	caesar = new Caesar

	crack: (analyzer, cipherText) ~~>
		analyzer.mostMeaningful {[lett, caesar.decrypt cipherText, lett] for lett in letters}