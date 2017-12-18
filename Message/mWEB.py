# encoding=utf-8
import web
from igetui.igt_message import IGtAppMessage
from igetui.template.igt_link_template import LinkTemplate
from igt_push import IGeTui
import config
#import ASmessage
def pushMessageToApp(title,href):
    push = IGeTui(config.HOST, config.APPKEY, config.MASTERSECRET)
    template = LinkTemplate()
    template.appId = config.APPID
    template.appKey = config.APPKEY
    template.title ='XSS:%s' %title
    template.text = "href:%s" %href
    template.logo = ""
    template.url = "http://112.74.204.232:8080/xssindex"
    template.transmissionType = 1
    template.transmissionContent = ''
    template.isRing = True
    template.isVibrate = True
    template.isClearable = True
    message = IGtAppMessage()
    message.data = template
    message.isOffline = True
    message.offlineExpireTime = 1000 * 600
    message.appIdList.extend([config.APPID])
    ret = push.pushMessageToApp(message)
    print ret
urls=(
    '/message','message',
)
app=web.application(urls,globals())
class message:
	def GET(self):
		n=web.input()
		title=n.get('title')
		href=n.get('href')
		if title !=None and href !=None:
			pushMessageToApp(title,href)
		return  ''
if __name__ == '__main__':
    app.run()