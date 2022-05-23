# Check here for pytest fixtures: https://docs.pytest.org/en/stable/reference/fixtures.html#fixture
# Check here for pytest-django fixtures: https://pytest-django.readthedocs.io/en/latest/helpers.html#fixtures


def test_admin_login_url_returns_200(client):
    response = client.get("/admin/login/")
    assert response.status_code == 200
