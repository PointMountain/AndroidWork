# encoding=utf-8
import MySQLdb
import config
def login(user,pwd):
    conn=MySQLdb.connect(host=config.host, port=config.port, user=config.user, passwd=config.pwd, db=config.db,charset='utf8')
    cursor=conn.cursor()
    sql="select pwd from admin WHERE user='%s'"
    sql=sql %user
    #print sql
    try:
        #print sql
        cursor.execute(sql)
        #print sql
        _pwd=cursor.fetchall()
        #print _pwd
        if pwd==_pwd[0][0]:
            cursor.close()
            conn.close()
            return True
        else:
            cursor.close()
            conn.close()
            return False
    except Exception,e:
        print e.args
        cursor.close()
        conn.close()
        return False
#print login('hlpureboy@163.com','123pyj.com')
def insertsx(title,url):
    try:
        conn = MySQLdb.connect(host=config.host, port=config.port, user=config.user, passwd=config.pwd, db=config.db,
                               charset='utf8')
        cursor = conn.cursor()
        sql="insert into sx(title,url) VALUES ('%s','%s')"
        sql=sql %(title,url)
        cursor.execute(sql)
        conn.commit()
        cursor.close()
        conn.close()
    except Exception,e:
        print e.args
#insertsx('xss','http://127.0.0.1:8080')
def insertepwd(ip,port,pwd):
    try:
        conn = MySQLdb.connect(host=config.host, port=config.port, user=config.user, passwd=config.pwd, db=config.db,
                               charset='utf8')
        cursor = conn.cursor()
        sql = "insert into epwd(ip,port,pwd) VALUES ('%s','%s','%s')"
        sql = sql % (ip,str(port),pwd)
        cursor.execute(sql)
        conn.commit()
        cursor.close()
        conn.close()
    except Exception, e:
        print e.args
#insertepwd('112.74.204.232',3306,'123pyj')