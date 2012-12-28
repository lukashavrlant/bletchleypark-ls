require! "./substitution"
require! '../utils/string'.letters

module.exports = class Caesar
	subs = new substitution
	encrypt: (openText, key) ~>
		subs.encrypt openText, @makeSubsKey key

	decrypt: (cipherText, key) ~>
		subs.decrypt cipherText, @makeSubsKey key

	makeSubsKey: (key) ~>
		letters |> breakIt (== key) |> reverse |> join ''