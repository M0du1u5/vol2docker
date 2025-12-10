FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
  python2 \
  python2-dev \
  gcc \
  git \
  curl \
  libdistorm3-dev \
  yara \
  libyara-dev \
  && rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
  python2 get-pip.py && \
  rm get-pip.py

RUN python2 -m pip install \
  distorm3 \
  pycryptodome \
  yara-python \
  pillow \
  openpyxl \
  ujson

RUN git clone https://github.com/volatilityfoundation/volatility.git /opt/volatility

WORKDIR /data
ENTRYPOINT ["python2", "/opt/volatility/vol.py"]
