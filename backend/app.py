from flask import Flask
from flask_cors import CORS
from models import db
import routes

app = Flask(__name__)
CORS(app)

# MySQL database URI
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:12341234@localhost/pay_and_care_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db.init_app(app)

# Register routes
app.register_blueprint(routes.bp)

if __name__ == "__main__":
    with app.app_context():
        db.create_all()  # Creates tables
    app.run(debug=True)
