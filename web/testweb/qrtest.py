# encoding=utf-8
import qrcode
import base64
from apscheduler.schedulers.blocking import BlockingScheduler
test='bf-cfb-auth:test@192.168.100.1:8888'
test_param="method:pwd@ip:port"
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4,
)
qr.add_data('ss://'+base64.b64encode(test))
qr.make(fit=True)
img = qr.make_image()
img.save('test.jpg')
