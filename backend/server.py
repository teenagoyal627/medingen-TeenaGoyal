from flask import Flask, jsonify,request
from flask_cors import CORS
import mysql.connector
import json
from dotenv import load_dotenv
import os
from flask_jwt_extended import JWTManager, create_access_token, jwt_required
from werkzeug.security import generate_password_hash, check_password_hash
load_dotenv()

print("server runs")
app = Flask(__name__)
CORS(app, origins=["http://localhost:3000"])

DATABASE_NAME = os.getenv("DATABASE_NAME")
MY_SQL_HOST = os.getenv("MY_SQL_HOST")
MY_SQL_PASSWORD = os.getenv("MY_SQL_PASSWORD")
MY_SQL_PORT = int(os.getenv("MY_SQL_PORT"))  # Convert port to integer
MY_SQL_USERNAME = os.getenv("MY_SQL_USERNAME")
db_config = {
    "database": DATABASE_NAME,
    "host": MY_SQL_HOST,
    "password": MY_SQL_PASSWORD,
    "port": MY_SQL_PORT,
    "user": MY_SQL_USERNAME,
  
}


app.config['JWT_SECRET_KEY'] = os.getenv('JWT_SECRET')  # Replace with a strong secret key
jwt = JWTManager(app)

@app.route('/login', methods=['POST'])
def login():
    try:
        print(request.json)
        cursor=db.cursor(dictionary=True)
        email = request.json['email']
        password = request.json['password']
        print(email,password)

        cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
        user = cursor.fetchone()

        if user and check_password_hash(user['password_hashed'], password):
            access_token = create_access_token(identity=email)
            return jsonify(access_token=access_token)
        else:
            return jsonify({'error': 'Invalid credentials'}), 401
    except Exception as err: 
        print('something went wrong, ',err)
        return jsonify({'error': 'Something went wrong'}),500
@app.route('/signup', methods=['POST'])
def signup():
    email = request.json.get('email')
    password = request.json.get('password')

    # Check if user already exists (based on email) 
    cursor = db.cursor()
    cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
    existing_user = cursor.fetchone()
    if existing_user:
        return jsonify({'message': 'Email already exists'}), 400

    # Hash the password for security
    hashed_password = generate_password_hash(password)

    # Insert new user
    insert_query = """
        INSERT INTO users (email, password_hashed) VALUES (%s, %s)
    """
    cursor.execute(insert_query, (email, hashed_password))
    db.commit()

    # Generate access token
    access_token = create_access_token(identity=email)  # Use email as identity
    return jsonify({'message': 'User created successfully', 'access_token': access_token})

db=mysql.connector.connect(**db_config)
@app.route('/medicine/<int:salt_id>',methods=['GET'])
@jwt_required()
def get_medicine_details(salt_id): 
    cursor=db.cursor(dictionary=True)
    try: 
      
        main_query = """
        SELECT
            sd.content,
            sd.uses_list,
            sd.works,
            sd.common_side_effect,
            sd.salt_name
        FROM
            salt_details sd
        WHERE
            sd.salt_id = %s
        """
        cursor.execute(main_query, (salt_id,))
        main_result = cursor.fetchone()
         # Fetch all remaining rows from main query
        cursor.fetchall() 
        if not main_result:
            print('medicine not found')
            return jsonify({'error': 'Medicine not found'}), 404
        # Products query
        products_query = """
        SELECT
            p.p_name,
            p.generic_name,
            p.p_company,
            p.avg_price,
            p.p_price,
            p.medicine_image,
            p.chemical_formation,
            rr.rating_value,
            rr.reviews
        FROM
            product_content p
        LEFT JOIN rating_review rr ON p.id = rr.id
        WHERE
            p.salt_id = %s
        """
        cursor.execute(products_query, (salt_id,))
        # Fetch all remaining rows from products query
        product_results = cursor.fetchall()  
        # print(product_results)
        product_return_results = []
        for pr in product_results:
            pr_rew = json.loads(pr['reviews'])
            pr_modified = pr
            pr_modified.update({'reviews': pr_rew})
            product_return_results.append(pr_modified)
        # print(product_return_results)
        # FAQs query
        faq_query = """
        SELECT
            q.question,
            q.answer
        FROM
            freq_ques q
        WHERE
            q.salt_id = %s
        """
        cursor.execute(faq_query, (salt_id,))
         # Fetch all remaining rows from FAQs query
        faq_results = cursor.fetchall() 

        # Salt rating reviews query
        salt_rating_review_query = """
        SELECT
            sr.salt_rating_value,
            sr.salt_reviews
        FROM
            salt_rating_review sr
        WHERE
            sr.salt_id = %s
        """
        cursor.execute(salt_rating_review_query, (salt_id,))
        salt_rating_review_result = cursor.fetchall()
        salt_rating_review_result = salt_rating_review_result[0]
        print(salt_rating_review_result)
        

        medicine_details = {
            "content": main_result["content"],
            "uses_list": json.loads(main_result["uses_list"]),
            "works": [w for w in json.loads(main_result["works"])],
            "common_side_effect": json.loads(main_result["common_side_effect"]),
            "salt_name": main_result["salt_name"],
            "products": product_return_results,
            "faq": [{"question": q["question"], "answer": q["answer"]} for q in faq_results],
            "salt_rating_reviews": {"value": salt_rating_review_result['salt_rating_value'], "reviews": json.loads(salt_rating_review_result['salt_reviews'])}
        }

        return jsonify(medicine_details)
       
    except Exception as e: 
        import traceback; traceback.print_exc();
        print(e)
        return jsonify ({"error":str(e)}),500
    finally: 
        cursor.close() 
 

if __name__ == '__main__':
    app.run(debug=True)
