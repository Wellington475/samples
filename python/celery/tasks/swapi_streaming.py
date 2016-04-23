# -*- coding: utf8 -*-

import swapi
from celery_worker import app

# First task
@app.task
def swapi_streaming(*args, **kwargs):
	luke = swapi.get_person(1)
	return luke