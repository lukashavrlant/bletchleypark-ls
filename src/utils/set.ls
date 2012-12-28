module.exports.intersection = (a, b) ~>
	unique filter (in b), a

module.exports.union = (a, b) ~>
	unique a +++ b

module.exports.diff = (a, b) ~>
	unique filter (not in b), a