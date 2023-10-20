# Copyright (c) General Electric Company, 2023.  All rights reserved.
FROM debian:bullseye-slim

# install Python 3 and Pip 3
RUN apt-get -y update && apt-get install -y $buildDeps --no-install-recommends \
    && apt-get install -y python3 python3-pip \
    && pip install --upgrade pip && hash -r

# install needed dependencies for Python 3
RUN pip install flask pika boto3 requests junit-xml pytest-cov \
    && pip install --upgrade setuptools

# install Python 3 and Pip 3
#RUN apt update -y \
#    && apt install -y python3 python3-pip

# install dependencies for Python 3
#RUN pip3 install flask pika boto3 requests junit-xml pytest-cov

# install Python 2
#RUN apt install -y python

# install Pip 2
#RUN apt install -y wget \
#    && wget --no-check-certificate http://bootstrap.pypa.io/pip/2.7/get-pip.py \
#    && python2 get-pip.py

# install dependencies for Python 2 (Need pika 1.1 which is the last version to support Python 2.7.)
#RUN pip2 install flask pika==1.1 boto3 requests junit-xml pytest-cov

# install dependencies
#RUN buildDeps='python-pip' \
#    && set -x \
#    && apt-get -y update && apt-get install -y $buildDeps --no-install-recommends \
#    && pip install --upgrade pip && hash -r \
#    && pip install flask pika boto3 requests junit-xml pytest-cov \
#    && pip install --upgrade setuptools

# install SDK
ADD rt106GenericAdaptorSQS.py rt106GenericAdaptorAMQP.py rt106GenericAdaptorREST.py rt106SpecificAdaptorCode.py rt106SpecificAdaptorDefinitions.json entrypoint.sh testGenericAdaptorAPIs.py testGenericAdaptorAMQP.py /rt106/

# configure folder structures
RUN mkdir /rt106/input && mkdir /rt106/output && mkdir /rt106/test

# set permissions
RUN chmod a+x /rt106/entrypoint.sh

# set the working directory
WORKDIR /rt106

# establish the user
# create non-privileged user and group
RUN groupadd -r rt106 && useradd -r -g rt106 rt106 && chown -R rt106:rt106 /rt106
USER rt106:rt106

# configure the default port for an analytic, can be overridden in entrypoint
EXPOSE 7106

# entry point
CMD ["/rt106/entrypoint.sh"]
