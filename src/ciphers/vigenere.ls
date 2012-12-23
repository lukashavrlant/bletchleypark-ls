require! "./caesar"

module.exports = class Vigenere
	encrypt: (openText, key) ~>
		@transform openText, key, (new caesar).encrypt

	decrypt: (cipherText, key) ~>
		@transform cipherText, key, (new caesar).decrypt

	transform: (text, key, fun) ~>
		longKey = replicate (text.length / key.length + 1), key |> join ''
		zipWith fun, text, longKey |> join ''