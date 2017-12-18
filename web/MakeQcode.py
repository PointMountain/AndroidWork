#encoding=utf-8
from Qcode import Getinfo
import qrcode
import base64
import os
from apscheduler.schedulers.blocking import BlockingScheduler
param="%s:%s@%s:%s"
def parserdict(dict_ls,param):
    try:
        for j in range(1,13):
            os.remove('../web/static/images/'+str(j)+'.jpg')
    except Exception,e:
        print e.message
    cunt=1
    for i in dict_ls:
        ss_info=param % (i.get('method'),i.get('password'),i.get('server'),i.get('server_port'))
        qr = qrcode.QRCode(
            version=1,
            error_correction=qrcode.constants.ERROR_CORRECT_L,
            box_size=10,
            border=4,
        )
        qr.add_data('ss://' + base64.b64encode(ss_info))
        qr.make(fit=True)
        img = qr.make_image()
        img.save('../web/static/images/'+str(cunt)+'.jpg')
        cunt=cunt+1
def job():
    a=Getinfo.Getinfo()
    parserdict(a.getinfo(),param)
scheduler=BlockingScheduler()
scheduler.add_job(job, 'cron', day_of_week='0-6', hour='0,6,12,18', minute=05)
scheduler.start()