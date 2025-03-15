from flask import Flask, jsonify
from flask_cors import CORS
import mysql.connector
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv(".env")

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes


# Database connection function
def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
        database=os.getenv("MYSQL_DATABASE"),
    )


@app.route("/deals", methods=["GET"])
def get_deals():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)  # Use dictionary cursor

    # Fetch all deals with structured data
    cursor.execute(
        "SELECT product_name, deal_description, price, discount_percentage, stock, image_url, total_rating FROM deals"
    )
    deals = cursor.fetchall()

    # Convert to a list of dictionaries
    deal_list = [
        {
            "product_name": deal["product_name"],
            "deal_description": deal["deal_description"],
            "price": float(deal["price"]),  # Ensure decimal conversion
            "discount_percentage": deal["discount_percentage"],
            "stock": deal["stock"],
            "image_url": deal["image_url"],
            "total_rating": float(deal["total_rating"]),
        }
        for deal in deals
    ]

    # Close connection
    cursor.close()
    connection.close()

    return jsonify(deal_list)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000, debug=True)
