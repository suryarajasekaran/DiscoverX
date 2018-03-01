from flask import Flask, request
from flask_restful import Api
import json
import requests

from database import *

app = Flask(__name__)
api = Api(app)


@app.route('/ping')
def ping():
    return json.dumps({"status": True})


@app.route('/user', methods=['POST'])
def user():
    if request.method == 'POST':
        ticket_data = request.get_json()
        DataAccess().mongodb_obj.add_ticket(ticket_data=ticket_data)
        return json.dumps({"status": True})
    else:
        return json.dumps({"status": False})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7771, debug=True)
