from __future__ import unicode_literals

class MyResource(object):
    pass

root = MyResource()

def get_root(request):
    return root
