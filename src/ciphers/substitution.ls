module.exports = class Substitution
	letters = 'abcdefghijklmnopqrstuvwxyz'
	encrypt: (openText, key) ~> 
		subs = listToObj zip letters, key
		map (subs.), openText

	decrypt: (cipherText, key) ~>
		subs = listToObj zip key, letters
		map (subs.), cipherText