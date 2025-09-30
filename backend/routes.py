from flask import Blueprint, request, jsonify
from models import db, User
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime

bp = Blueprint('routes', __name__)

# Registration
@bp.route('/register', methods=['POST'])
def register():
    data = request.json
    name = data['name']
    mobile = data['mobile']
    dob = data.get('dob')  # Optional
    password = data['password']

    if User.query.filter_by(mobile=mobile).first():
        return jsonify({"message": "Mobile already registered"}), 400

    password_hash = generate_password_hash(password)
    dob_date = datetime.strptime(dob, '%Y-%m-%d').date() if dob else None
    new_user = User(name=name, mobile=mobile, dob=dob_date, password_hash=password_hash)

    db.session.add(new_user)
    db.session.commit()

    return jsonify({"message": "User registered successfully"}), 201

# Login
@bp.route('/login', methods=['POST'])
def login():
    data = request.json
    mobile = data['mobile']
    password = data['password']

    user = User.query.filter_by(mobile=mobile).first()
    if not user or not check_password_hash(user.password_hash, password):
        return jsonify({"message": "Invalid mobile or password"}), 401

    return jsonify({"message": "Login successful", "user_id": user.id, "name": user.name}), 200
