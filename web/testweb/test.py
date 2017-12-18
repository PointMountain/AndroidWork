# encoding=utf-8
import web
urls = (
    '/index','h',
    '/(.*)', 'hello'
)
app = web.application(urls, globals())
temp=web.template.render('temp')
class h:
    def GET(self,name):
        return temp.index(name)
    def POST(self):
        name=web.input().get('name')
        #print name
        return temp.index(name)
class hello:
    def GET(self, name):
        return temp.index(name)
if __name__ == "__main__":
    app.run()