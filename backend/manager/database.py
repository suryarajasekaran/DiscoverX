import pymongo
import ast
import json
from bson import json_util
from bson.objectid import ObjectId
import os

class DataAccess(object):

    def __init__(self):
        mongodb_url = "mongodb://heroku_vl4kdnfm:pgsdq90hk47vef4nboqha2sklk@ds251548.mlab.com:51548/heroku_vl4kdnfm"
        self.mongodb_obj = MongoDB(url=mongodb_url)

class MongoDB(object):

    def __init__(self, url):
        self.client = pymongo.MongoClient(url)
        self.default_db = self.client.get_default_database()
        self.collection_ticket = self.default_db["ticket"]

    @staticmethod #converts bson to json
    def json_out(results):
        json_results = []
        for result in results:
            json_results.append(result)
        return ast.literal_eval(json.dumps(json_results, default=json_util.default))

    ####################
    # TICKET
    ####################

    def add_ticket(self, ticket_data):
        self.collection_ticket.insert(ticket_data)
        return True

    def get_ticket(self, query_filter={}):
        return self.json_out(self.collection_ticket.find(query_filter))

    def delete_ticket(self, query_filter={}):
        query_data = self.get_ticket(query_filter=query_filter)
        if len(query_data) == 1:
            self.collection_ticket.remove(ObjectId(query_data[0]["_id"]["$oid"]))
            return True
        else:
            return False