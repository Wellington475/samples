from __future__ import unicode_literals

import logging
import pysolr

log = logging.getLogger(__name__)

class Solr(object):
	def __init__(self):
		self.solr = pysolr.Solr('http://localhost:8983/solr/twitter')