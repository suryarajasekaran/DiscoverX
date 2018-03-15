from flask import Flask, render_template
from flask_restful import Api

app = Flask(__name__)
api = Api(app)

@app.route('/f/ping')
def ping():
    return json.dumps({"status":True})

@app.route('/f/')
@app.route('/f/home')
def home():
    return render_template("home.html")

@app.route('/f/user')
def user():
    return render_template("user.html")

@app.route('/f/manager')
def manager():
    return render_template("manager.html")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7772, debug=True)
