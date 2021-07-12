FROM quantumsec/ci-analysis-collector:latest

ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache git util-linux python3 && \
  ln -sf python3 /usr/bin/python && \
  ln -sf pip3 /usr/bin/pip && \
  python -m ensurepip && \
  pip install --no-cache-dir --upgrade pip setuptools && \
  pip install --no-cache-dir -U checkov
