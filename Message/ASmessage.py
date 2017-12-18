# encoding=utf-8
from igetui.igt_message import IGtAppMessage
from igetui import template as temp
from igt_push import IGeTui
import config
def pushMessageToApp(title,href):
    push = IGeTui(config.HOST, config.APPKEY, config.MASTERSECRET)
    template = temp.igt_link_template.LinkTemplate()
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
