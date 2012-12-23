require! substitution: "./substitution"

module.exports = class Caesar
	letters = 'abcdefghijklmnopqrstuvwxyz'
	encrypt: (openText, key) ~>
		(new substitution).encrypt openText, @makeSubsKey key

	decrypt: (cipherText, key) ~>
		(new substitution).decrypt cipherText, @makeSubsKey key

	makeSubsKey: (key) ~>
		letters |> breakIt (== key) |> reverse |> join ''