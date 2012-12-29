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

deepEq {a:2,b:1,c:3,d:0,e:0,f:0,g:0,h:0,i:0,j:0,k:0,l:0,m:0,n:0,o:0,p:0,q:0,r:0,s:0,t:0,u:0,v:0,w:0,x:0,y:0,z:0} analyzer.counter \aabccc

deepEq {a:0.5, b:0.25, c:0.25} analyzer.occurences {a:2, b:1, c:1}

eq 0.4 analyzer.deviation langStats.letters, { a: 0.4, c: 0.3, b: 0.2, d: 0.1 }

eq 3462 round analyzer.similarity 'abcbbceed'

eq \a analyzer.mostMeaningful {a:'abababac', b:'decdedea', c:'bedeacde'}

deepEq [\a \c] analyzer.topLetters {a:5, b:3, c:4, d:2}, 2
deepEq [\a \b \c] analyzer.topLetters {a:5, b:5, c:4, d:2}, 3

deepEq [ 'a', 'v', 's', 'z', 'o', 'i', 'k', 'u', 'c', 'g', 'm', 'p', 'e', 'd', 'b', 'x', 'r', 'h', 'j', 't', 'n', 'l', 'w', 'y', 'f', 'q' ], analyzer.words 1