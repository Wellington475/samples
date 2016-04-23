# -*- coding: utf8 -*-

from __future__ import absolute_import

from celery import Celery

APPS = [
	'tasks.swapi_streaming',
]

app = Celery('twitter', broker='redis://localhost:6379/0', include=APPS)