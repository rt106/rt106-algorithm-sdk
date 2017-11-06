# Nanalytics
 _Copyright (c) General Electric Company, 2017.  All rights reserved._

Example of a container providing multiple analytics.

Each analytic has a separate queue and provides a REST interface on a separate port.

The pattern is a slight variation of the single analytic case documented in the
rt106-algorithm-sdk. Here, each analytic will have it own

1. Job queue and response queue
2. REST API provided on a unique port
3. Directory storing
    * rt106SpecificAdaptorCode.py
    * rt106SpecificAdaptorDefinitions.py
    * input directory
    * output directory

To build the Docker image:

```
docker build -t rt106/rt106-nanalytics --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy .
```
