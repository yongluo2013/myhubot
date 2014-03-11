# Description:
#   Utility commands help to check jenkins job status
#
# Commands:
#   hubot check <job_name> - check jenkins job status


http = require 'http'
module.exports = (robot) ->
  robot.respond /check (.*)/i, (msg) ->
    job_name = newOpt = msg.match[1].trim().toLowerCase()
    pathurl = 'http://busstv-test-jenkins.sh.cn.ao.ericsson.se/job/' + job_name + '/api/json?pretty=true'
    opt = {host:'busstv-test-jenkins.sh.cn.ao.ericsson.se',method:'GET',path:pathurl}
    http.get opt ,(res)->
      data = ''
      res.on 'data' ,(chunk)->
        data+=chunk.toString()
      res.on 'end', () ->
        formatdata = JSON.parse data
        i = 0
        build_list = ''
        for item in formatdata.builds
          build_list += item.number.toString()
          build_list += ' '
        msg.reply "================================================================="        
        msg.reply "DisplayName:" + formatdata.displayName
        msg.reply "URL:" + formatdata.url
        msg.reply "Color:" +  formatdata.color
        msg.reply "Build list:" + build_list
        msg.reply "================================================================="
