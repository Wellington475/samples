from pyramid.i18n import TranslationStringFactory

_ = TranslationStringFactory('sample')


def my_view(request):
    return {'project': 'sample'}
