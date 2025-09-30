from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    mobile = db.Column(db.String(15), unique=True, nullable=False)
    dob = db.Column(db.Date, nullable=True)
    wallet_balance = db.Column(db.Float, default=0)
    password_hash = db.Column(db.String(255), nullable=False)
