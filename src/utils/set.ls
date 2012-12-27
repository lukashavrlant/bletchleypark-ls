intersection = (a, b) ~>
	unique filter (in b), a

union = (a, b) ~>
	unique a +++ b

diff = (a, b) ~>
	unique filter (not in b), a

module.exports.intersection = intersection
module.exports.union = union
module.exports.diff = diff