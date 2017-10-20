# Copyright (c) General Electric Company, 2017.  All rights reserved.
# Rt106
# Template for integrating a new algorithm.
# This is one of two required source files that need to be adapted for integrating an algorithm:
#     This Python script is for marshalling data and running the algorithm.
#     A separate Python script contains definitions with declarations.

# This template file has places where you need to add your own code for marshalling data and running your algorithm.
# If left unchanged, the template will result in a skeleton "algorithm" the registers itself and trivially responds
# to request messages.

# Please follow the numbered steps 1-5 below.

import time, json

# function: run_algorithm() -- Python function for marshalling your data and running your algorithm.
# parameters:
#   datastore: object to be used when interacting with the Object Store
#   context:  A JSON structure that should contain all the inputs and parameters your algorithm needs.
def run_algorithm(datastore, context):

    # 1.    Add code here for marshalling your inputs.  You may receive URIs in 'context' that reference image or data
    #       files.  You need to fetch that data using the Object Store API.  (TODO:  Provide that documentation.)

    #       The 'datastore' object provides a method named 'retrieveSeries', which takes two inputs. The 1st input identifies
    #       which series data should be retrieved from the datastore. The individual components of the path 'patient', 'study' and
    #       'series', identify the series data. The 2nd input specifies where the data should be placed within the container.
    #
    #        Following ia an example of using this method:
    #
    #             datastore.retrieveSeries('patientID/studyID/seriesID','/tmp/input')
    #

    # 2.    Add code here for calling your algorithm.  This may be an "exec" of an external command-line driven process.
    #       Alternately, it may be a call into a Python library that you provide.
    #       This call should wait for your algorithm to complete to receive status and results.
    #       (Asynchronism and parallelism are handled elsewhere.)

    # TODO:  Provide an example exec that does something trivial.

    # 3.    Based on the success or failure of your algorithm execution, set the 'status' variable to an appropriate string.
    #       Allowed values are documented here:  https://devcloud.swcoe.ge.com/devspace/pages/viewpage.action?spaceKey=ABZED&title=Message+formats
    status = "EXECUTION_FINISHED_SUCCESS"

    # 4.    If you have result files, you need to store them in the Object Store, and obtain the URIs that refer to those files.

    #       Tha 'datastore' object provides a method baned 'uploadSeries', which takes two inputs. The 1st input specifies
    #       the identity of the series to be created on the datastore. The 2nd input identifies where the data should be retrieved
    #       from the container, and placed into the series.
    #
    #       Following is an example of using this method:
    #
    #           datastore.uploadSeries('patientID/studyID/seriesID','/tmp/output')
    #

    # 5.    You need to create the context JSON structure containing your results, including URIs obtained above in step 4.
    #       Replace the trivial example below with the results from your algorithm.
    context = {
        "outputSeries" : "/this/is/my/URI",
        "calculatedValue" : 999
    }

    return { 'result' : context, 'status' : status }
