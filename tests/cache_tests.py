import pytest

from django.core.cache import cache

@pytest.fixture
def cache_data():
    return '장고 캐시 데이터'

def test_cache_can_set_key(cache_data):
    res = cache.set('test_cache_key', cache_data)
    assert res == True

def test_cache_can_get_key(cache_data):
    value = cache.get('test_cache_key')
    assert value == cache_data

def test_cache_can_delete_key():
    res = cache.delete('test_cache_key')
    assert res == True
