import flask
from flask import request
import cv2
import numpy as np

app = flask.Flask(__name__)


@app.route("/translate", methods=["POST"])
def translate():
    if(request.method == "POST"):
        data = request.files["File"].read()  # Get the image byte data
        img = cv2.imdecode(np.frombuffer(data, np.uint8), cv2.IMREAD_COLOR)
        cv2.imwrite("./test.png", img)
        return flask.Response(status=200)
