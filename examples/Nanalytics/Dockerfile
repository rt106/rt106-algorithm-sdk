FROM rt106/rt106-algorithm-sdk

# remove the SDK versions from the template algorithm
RUN rm /rt106/rt106SpecificAdaptorCode.py /rt106/rt106SpecificAdaptorDefinitions.json

# add the analytics
ADD nanalytic1 /rt106/nanalytic1
ADD nanalytic2 /rt106/nanalytic2
ADD nanalytic3 /rt106/nanalytic3

# add the entry point
ADD entrypoint.sh  /rt106/entrypoint.sh

# change file ownership to rt106
USER root
RUN chown -R rt106:rt106 /rt106
USER rt106:rt106

# make the input and output area
RUN mkdir /rt106/nanalytic1/input && mkdir /rt106/nanalytic1/output
RUN mkdir /rt106/nanalytic2/input && mkdir /rt106/nanalytic2/output
RUN mkdir /rt106/nanalytic3/input && mkdir /rt106/nanalytic3/output

# set the working directory
WORKDIR /rt106

CMD ["/rt106/entrypoint.sh"]
