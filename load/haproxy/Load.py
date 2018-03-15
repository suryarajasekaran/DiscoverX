import subprocess
import os
from multiprocessing import Process
import requests
from random import randint

webapp_end_point_dict = {
                                "agent"    : ["/a/ping","/a/agent"],
                                "user"    : ["/u/ping","/u/user"],
                                "manager"  : ["/m/ping","/m/manager"],
                                "frontend"   : ["/f/ping","/f/frontend"]
                          }

def induce_load_endpoint(end_point):
    print "This is a induce load program"
    requests.get("http://ec2-54-241-167-30.us-west-1.compute.amazonaws.com:"+str(end_point[0]))


def parallel_induce_load_endpoint(webapp_name, load_parallel):
    p_list = []
    for i in range(0, load_parallel):
        p = Process(target=induce_load_endpoint, args=(webapp_end_point_dict[webapp_name],))
        p.start()
    for p in p_list:
        p.join()


