from flask import Flask, request
from flask_restful import Api
from flask_cors import CORS, cross_origin
import json
import requests

from database import *

app = Flask(__name__)
CORS(app)
api = Api(app)

@app.route('/a/ping')
@cross_origin(origin='*')
def ping():
    return json.dumps({"status": True})


@app.route('/a/agent', methods=['GET','POST'])
@cross_origin(origin='*')
def agent():
    if request.method == 'GET':
        return json.dumps(DataAccess().mongodb_obj.get_ticket())
    elif request.method == 'POST':
        query_filter = {"AgentName": 'Sudhish'}
        return json.dumps(DataAccess().mongodb_obj.get_ticket(query_filter=query_filter))
    else:
        return json.dumps({"status": False})

@app.after_request
def after_request(response):
  response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
  response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
  response.headers.add('Access-Control-Allow-Credentials', 'true')
  return response

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7774, debug=True)
