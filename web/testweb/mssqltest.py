# encoding=utf-8
import pymssql
import sys
reload(sys)
sys.setdefaultencoding('utf8')
conn=pymssql.connect(server='127.0.0.1',user='sa',password='123pyj',database='Libary',charset='utf8')
cursor = conn.cursor()
cursor.execute('''
select * from Book where 书名=路易·波拿巴的雾月十八日
'''.decode('utf8'))
data = cursor.fetchone()
while data:
    print data
    data=cursor.fetchone()
