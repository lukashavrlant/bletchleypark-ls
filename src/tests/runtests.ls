#!/opt/local/bin/node
each (~> it.replace '.js' '' |> require), require('glob').sync('./test-*.js')
console.log 'Chill out, everything is OK.'