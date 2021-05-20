import flask
from flask import request
from flask import jsonify
from flask_cors import CORS
import cv2
import numpy as np
import easyocr

app = flask.Flask(__name__)
CORS(app)
reader = easyocr.Reader(['it'], gpu=False)


def get_format(filename):
    fformat = filename.split(".")[1]
    return fformat


@app.route("/translate", methods=["POST"])
def translate():
    response = jsonify({})

    if(request.method == "POST"):
        ffile = request.files["File"]
        fformat = get_format(ffile.filename)

        if(fformat == 'png' or fformat == 'jpg'):
            data = ffile.read()  # Get the image byte data
            img = cv2.imdecode(np.frombuffer(data, np.uint8), cv2.IMREAD_COLOR)
            res = reader.readtext(img)
            content = ""

            for el in res:
                content += el[1] + " "

            response = jsonify({
                "Content": content
            })
        else:
            return {}, 415

    return response
