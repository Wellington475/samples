from __future__ import unicode_literals

from pyramid.view import view_config

#@view_config(renderer='json')
def home(request):
    return {'project': 'sample'}
