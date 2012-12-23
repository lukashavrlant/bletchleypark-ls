module.exports = class Transposition
	encrypt: (openText, key) ~>
		splitted = @splitText key.length, openText 
		@joinText map (~> @switchLetters it, @pattern key), splitted

	decrypt: (cipherText, key) ~>
		splitted = @splitDecText key.length, cipherText
		map (~> @switchLetters it, @decPattern key), splitted |> join ''

	splitDecText: (keylen, text) ~>
		@splitText keylen, (@splitText text.length / keylen, text |> @joinText)

	splitText: (len, text) ~> 
		| text.length <= len  => [text + 'x' * (len - text.length)]
		| _ => [A, B] = splitAt len, text; [A] +++ @splitText len, B

	joinText: (texts) ~>
		| texts.length == 0 or texts[0] == '' => ''
		| _ => (concatMap head, texts) + @joinText map tail, texts

	pattern: (key) ~>
		lst = for it, i in key
			[it, i]
		map last, sortBy (compare head), lst

	decPattern: (key) ~>
		pattern = @pattern key
		lst = for it, i in pattern
			[it, i]
		map last, sortBy (compare head), lst

	switchLetters: (text, pattern) ~>
		concatMap (text.), pattern