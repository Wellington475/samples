from __future__ import unicode_literals

from pyramid.config import Configurator
from sample.resources import get_root

def main(global_config, **settings):
    settings = dict(settings)
    
    config = Configurator(root_factory=get_root, settings=settings)
    config.include('pyramid_jinja2')
    config.add_static_view('static', 'static')
    config.add_view('sample.views.home', context='sample.resources.MyResource', renderer='json')

    return config.make_wsgi_app()
