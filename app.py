import flask
from flask import request
import cv2
import numpy as np
import easyocr

app = flask.Flask(__name__)
reader = easyocr.Reader(['it'], gpu=False)


@app.route("/translate", methods=["POST"])
def translate():
    if(request.method == "POST"):
        data = request.files["File"].read()  # Get the image byte data
        img = cv2.imdecode(np.frombuffer(data, np.uint8), cv2.IMREAD_COLOR)
        res = reader.readtext(img)
        content = ""

        for el in res:
            content += el[1] + " "

        resp = {
            "Content": content
        }

        return resp
