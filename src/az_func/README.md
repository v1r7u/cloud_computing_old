# README

To insert event: `echo $(date) | xargs -I{} curl -d '{"name":"the eleventh", "time":"{}"}' -X POST http://localhost:7071/api/HttpToEventHub`
