# README

Create and activate virtual environment:

```
python3 -m venv .venv
source .venv/bin/activate
```


To insert event: `echo $(date) | xargs -I{} curl -d '{"name":"the eleventh", "time":"{}"}' -X POST http://localhost:7071/api/HttpToEventHub`
