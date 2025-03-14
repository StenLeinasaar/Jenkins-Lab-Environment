from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes


@app.route("/deals", methods=["GET"])
def get_deals():
    deals = [
        "50% off on Shoes",
        "Buy 1 Get 1 Free on T-Shirts",
        "Discount on Electronics",
    ]
    return jsonify(deals)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000, debug=True)
