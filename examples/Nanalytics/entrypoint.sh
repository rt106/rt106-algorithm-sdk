#!/bin/sh
# Copyright (c) General Electric Company, 2017.  All rights reserved.

/usr/bin/python3 ./rt106GenericAdaptorREST.py --module nanalytic1 --port 7106 &
/usr/bin/python3 ./rt106GenericAdaptorAMQP.py  --module nanalytic1 --broker rabbitmq --dicom datastore:5106 &

/usr/bin/python3 ./rt106GenericAdaptorREST.py --module nanalytic2 --port 7107 &
/usr/bin/python3 ./rt106GenericAdaptorAMQP.py  --module nanalytic2 --broker rabbitmq --dicom datastore:5106 &

/usr/bin/python3 ./rt106GenericAdaptorREST.py --module nanalytic3 --port 7108 &
/usr/bin/python3 ./rt106GenericAdaptorAMQP.py  --module nanalytic3 --broker rabbitmq --dicom datastore:5106
