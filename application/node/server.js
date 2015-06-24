var http = require('http');
http.createServer(function (req, res) {
  console.log(req.url);
  res.writeHead(200, {'Content-Type': 'text/plain', 'Content-Type': 'application/json;charset=utf-8'});
  res.end('Hello Nodejs!');
}).listen(8080, "0.0.0.0");
console.log('Server running at http://0.0.0.0:8080/');