combinations = (list, n) ~>
	| n == 0  => [[]]
	| empty list => []
	| _ => [[head list] +++ a for a in combinations (tail list), n - 1] +++ combinations (tail list), n

module.exports.combinations = combinations