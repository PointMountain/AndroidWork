# encoding=utf-8
import psutil
import os
import json
def getinfo():
    name=os.name
    free_mermory= psutil.virtual_memory().free
    hard_mermory=psutil.disk_partitions()
    return json.dumps(dict(name=name,free_mermory=free_mermory,hard_mermory=hard_mermory))