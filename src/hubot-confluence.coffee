nconf = require("nconf")
btoa = require("btoa")

cwd = process.cwd()
DEFAULTS_FILE = "#{__dirname}/data/defaults.json"

nconf.argv()
    .env()
    .file('defaults', DEFAULTS_FILE)

search = (msg, query) ->

  num_results = nconf.get("HUBOT_CONFLUENCE_NUM_RESULTS") or 1
  space = nconf.get("HUBOT_CONFLUENCE_SEARCH_SPACE")
  suffix = "content/search?cql=type=page&space=#{space}&query=#{query}"
  url = make_url(suffix)
  headers = make_headers()

  msg.http(url).headers(headers).get() (e, res, body) ->
    if e
      msg.send "Error: #{e}"
      return

    content = JSON.parse(body)
    
    count = 0
    for result in content.results
      count += 1
      if count > num_results
        break
      link = make_url(result._links.webui)
      msg.send "#{result.title} - #{link}"

make_headers = ->

  user = nconf.get("HUBOT_CONFLUENCE_USER")
  password = nconf.get("HUBOT_CONFLUENCE_PASSWORD")

  auth = btoa("#{user}:#{password}")

  ret = 
    Accept: "application/json"
    Authorization: "Basic #{auth}"


make_url = (suffix) -> 
    host = nconf.get("HUBOT_CONFLUENCE_HOST")  
    port = nconf.get("HUBOT_CONFLUENCE_PORT")  

    "https://#{host}:#{port}/wiki/rest/api/#{suffix}"
   
help = (msg) ->
  commands = [
    "confluence help"
    "confluence search SEARCH PHRASE"
  ]
  buf = ""
  for command in commands
    buf += "#{command}\n"

  msg.send buf
module.exports = (robot) ->

  robot.hear /confluence search (.*)/i, (msg) ->
    msg.send msg.match[1]
    search(msg, msg.match[1])

  robot.hear /confluence help/i, (msg) ->
    help(msg)
