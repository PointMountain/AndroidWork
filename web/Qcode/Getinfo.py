# encoding=utf-8
import requests
from bs4 import BeautifulSoup
import re
import json
class Getinfo:
    '''
    获取free vpn信息
    将数据按ServerSocket的json数据进行保存
    ss_list=[]存储ss的信息
    '''
    # ss_list=[]
    url="https://go.ishadowx.net/index_cn.html"
    def getinfo(self):
        '''
        ss_dict={}存储每一个ss信息
        :return:
        '''
        try:
            ss_list = []
            content=requests.get(self.url).content
            ss_dict = {
                'server': '',
                'server_port': '',
                'password': '',
                'method': '',
                "remarks": ""
            }
            beautifulsoup = BeautifulSoup(content,'html.parser',from_encoding='utf-8')
            server=beautifulsoup.find_all('span',attrs={'id':re.compile(r'ip?')})
            server_port=beautifulsoup.find_all('span',attrs={'id':re.compile(r'port?')})
            password=beautifulsoup.find_all('span',attrs={'id':re.compile(r'pw')})
            method=re.findall(u'加密方式:.*</h4>',content.decode('utf-8'))
            count=len(server)
            i=0
            while(i<count):
                ss_dict['server']=server[i].text
                ss_dict['server_port']=server_port[i].text.split('\n')[0]
                ss_dict['password']=password[i].text.split('\n')[0]
                ss_dict['method']=method[i].split(':')[1].split('<')[0]
                i=i+1
                ss_list.append(ss_dict)
                ss_dict = {
                    'server': '',
                    'server_port': '',
                    'password': '',
                    'method': '',
                    "remarks": ""
                }
            return ss_list
        except:
            return False
Getinfo().getinfo()
