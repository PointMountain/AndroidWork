# encoding=utf-8
import numpy as np
ls=[63,80,61,78,26,30]
ls1=[44,18,7,6,7]
count=0
def msg(low,high):
    global ls
    global count
    count=count+1
    mid = (low + high) / 2
    print '执行第%s次算法 low:%s mid:%s high:%s' % (count, low, mid, high)
    if low<high:
        mid=(low+high)/2
        #print '执行第%s次算法 low:%s mid:%s high:%s' %(count,low,mid,high)
        msg(low,mid)
        msg(mid+1,high)
        print count,
        print '执行排序，此时low:%s mid:%s high:%s' %(low,mid,high)
        m2sg(low,mid,high)
def m2sg(p,q,r):
    global ls
    b=np.zeros(r+1,np.int8)
    i=p
    j=q+1
    k=p
    print 'p:%s,q:%s,r:%s'%(p,q,r)
    print '开始排序:i:%s j:%s k:%s'%(i,j,k)
    while i<=q and j<=r:
        if ls[i]<=ls[j]:
            b[k]=ls[i]
            k = k + 1
            i = i + 1
        else:
            b[k]=ls[j]
            k = k + 1
            j= j + 1
    if i==q+1:
        for x in range(j,r+1):
            b[k]=ls[x]
            k = k + 1
    else:
        for x in range(i,q+1):
            b[k]=ls[x]
            k = k + 1
    for y in range(p,r+1):
        ls[i]=b[i]
    print '此时排序顺序 %s'%ls
msg(0,5)