from flask import Flask, request
from flask_restful import Api
from flask_cors import CORS, cross_origin
import json
import requests

from database import *

app = Flask(__name__)
CORS(app)
api = Api(app)

@app.route('/u/ping')
@cross_origin(origin='*')
def ping():
    return json.dumps({"status": True})


@app.route('/u/user', methods=['POST'])
@cross_origin(origin='*')
def user():
    if request.method == 'POST':
        ticket_data = request.get_json()
        DataAccess().mongodb_obj.add_ticket(ticket_data=ticket_data)
        return json.dumps({"status": True})
    else:
        return json.dumps({"status": False})

@app.after_request
def after_request(response):
  response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
  response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
  response.headers.add('Access-Control-Allow-Credentials', 'true')
  return response

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7771, debug=True)
