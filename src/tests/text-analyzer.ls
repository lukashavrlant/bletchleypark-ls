require! './unittest'
require! TextAnalyzer:'../cryptanalysis/text-analyzer'

langStats = {
	topwords: [\abc, \bac, \dec],
	letters: {
		a:0.3,
		b:0.3,
		c:0.2,
		d:0.1,
		e:0.1
	},
	bigrams: {
		ab: 0.4,
		ac: 0.2,
		bc: 0.1,
		cd: 0.1,
		ce: 0.1,
		be: 0.1
	}
}

analyzer = new TextAnalyzer langStats

deepEq ['a', 'h', 'o', 'j'] analyzer.splitText \ahoj 1
deepEq [\ah \oj] analyzer.splitText \ahoj 2
deepEq [\liv \esc \rip \t] analyzer.splitText \livescript 3

deepEq {a:2, b:1, c:3} analyzer.counter \aabccc
deepEq {foo:2, bar:1, meow: 2} analyzer.counter [\foo \meow \bar \meow \foo]

deepEq {a:0.5, b:0.25, c:0.25} analyzer.occurences {a:2, b:1, c:1}

eq 0.4 analyzer.deviation langStats.letters, { a: 0.4, c: 0.3, b: 0.2, d: 0.1 }

eq 3272 round analyzer.similarity 'abcbbceed'

eq \a analyzer.mostMeaningful {a:'abababac', b:'decdedea', c:'bedeacde'}