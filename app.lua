local cjson = require "cjson"

resp = ngx.location.capture('/__mesos_dns/v1/services/_' .. os.getenv("APP_NAME") .. '._tcp.marathon.mesos')
backends = cjson.decode(resp.body)
backend = backends[1]
ngx.var.target = "http://" .. backend['ip'] .. ":"  .. backend['port']
