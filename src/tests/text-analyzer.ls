require! './unittest'
require! TextAnalyzer:'../cryptanalysis/text-analyzer'

analyzer = new TextAnalyzer

deepEq ['a', 'h', 'o', 'j'] analyzer.splitText \ahoj 1
deepEq [\ah \oj] analyzer.splitText \ahoj 2
deepEq [\liv \esc \rip \t] analyzer.splitText \livescript 3

deepEq {a:2, b:1, c:3} analyzer.counter \aabccc
deepEq {foo:2, bar:1, meow: 2} analyzer.counter [\foo \meow \bar \meow \foo]

deepEq {a:0.5, b:0.25, c:0.25} analyzer.occurences {a:2, b:1, c:1}