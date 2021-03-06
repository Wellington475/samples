import unittest
from pyramid import testing

class ViewTests(unittest.TestCase):

    def setUp(self):
        testing.setUp()
        
    def tearDown(self):
        testing.tearDown()

    def test_my_view(self):
        from sample.views import my_view
        request = testing.DummyRequest()
        response = my_view(request)
        self.assertEqual(response['project'], 'sample')