import flask

app = flask.Flask(__name__)


@app.route("/translate")
def translate():
    return "it works"
