# Description:
#   Utility commands for hubot say hello.
#
# Commands:
#   hubot hello - hubot say hello!

module.exports = (robot) ->
  robot.respond /eluoyng_hello$/i, (msg) ->
    msg.send "hello!Luo Yong"

