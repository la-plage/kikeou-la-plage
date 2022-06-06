FROM python:3.10.4-slim-buster AS django

USER root

# TODO git can be removed once we use pypi package in place of repo
RUN apt-get -y update --no-install-recommends \
    && apt-get install -y \
        git \
    && apt-get -y clean

RUN mkdir -p /requirements
COPY requirements/base.txt /usr/local/pip-requirements/
# FIXME currently, package source are downloaed in "WORKDIR" and package egg is not with other packages => workaround now is to run `pip install` from /requirements
WORKDIR /requirements
RUN pip3 install \
    --quiet \
    --no-binary :none: \
    -r /usr/local/pip-requirements/base.txt

RUN mkdir -p /code
WORKDIR /code
COPY apps/ /code/apps
COPY django_conf/ /code/django_conf
COPY manage.py /code/


FROM django AS django-dev

COPY requirements/dev.txt /usr/local/pip-requirements/
# FIXME currently, package source are downloaed in "WORKDIR" and package egg is not with other packages => workaround now is to run `pip install` from /requirements
WORKDIR /requirements
RUN pip3 install \
    --quiet \
    --no-binary :none: \
    -r /usr/local/pip-requirements/dev.txt

WORKDIR /code
COPY tests/ /code/tests
COPY pyproject.toml /code/
COPY pytest.ini /code/
