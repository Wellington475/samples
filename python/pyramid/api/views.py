from __future__ import unicode_literals

import logging
from pyramid.view import view_config

log = logging.getLogger(__name__)

@view_config(route_name='home', renderer='home.jinja2')
def home(request):
	log.debug('Starting log')
	return {'name': 'Home View'}

