FROM python:3.10.4-slim-buster AS django

USER root

RUN mkdir -p /code
WORKDIR /code

# RUN apt-get -y update --no-install-recommends \
#     && apt-get install -y \
#         gettext \
#     && apt-get -y clean

COPY requirements/base.txt /usr/local/pip-requirements/
RUN pip3 install \
    --quiet \
    --no-binary :none: \
    -r /usr/local/pip-requirements/base.txt

COPY apps/ /code/apps
COPY django_conf/ /code/django_conf
COPY manage.py /code/


FROM django AS django-dev

COPY requirements/dev.txt /usr/local/pip-requirements/
RUN pip3 install \
    --quiet \
    --no-binary :none: \
    -r /usr/local/pip-requirements/dev.txt

COPY tests/ /code/tests
COPY pyproject.toml /code/
COPY pytest.ini /code/
