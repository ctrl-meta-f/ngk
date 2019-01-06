FROM python:3.7

COPY requirements.txt requirements.txt
RUN set -ex && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
            libpq-dev \
            libxml2-dev \
            postgresql-client \
            postgresql-client-common \
            && \
    pip install -r requirements.txt

COPY webapp /webapp
WORKDIR /webapp

ENTRYPOINT [ "python", "fetch_posts.py"]
