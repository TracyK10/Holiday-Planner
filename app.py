from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Configure the SQLite database
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///holiday_planner.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Define models
class Customer(db.Model):
    CustomerID = db.Column(db.Integer, primary_key=True)
    FirstName = db.Column(db.String(50))
    Surname = db.Column(db.String(50))
    TelephoneNumber = db.Column(db.String(20))
    EmailAddress = db.Column(db.String(100))

class Destination(db.Model):
    DestinationID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(100))
    Country = db.Column(db.String(100))
    Description = db.Column(db.Text)

class Booking(db.Model):
    BookingID = db.Column(db.Integer, primary_key=True)
    CustomerID = db.Column(db.Integer, db.ForeignKey('customer.CustomerID'))
    DestinationID = db.Column(db.Integer, db.ForeignKey('destination.DestinationID'))
    StartDate = db.Column(db.Date)
    EndDate = db.Column(db.Date)
    Budget = db.Column(db.Numeric(10, 2))

class ImportantInformation(db.Model):
    InfoID = db.Column(db.Integer, primary_key=True)
    BookingID = db.Column(db.Integer, db.ForeignKey('booking.BookingID'))
    DietaryRequirements = db.Column(db.String(255))
    MedicalConditions = db.Column(db.String(255))

class Excursion(db.Model):
    ExcursionID = db.Column(db.Integer, primary_key=True)
    ExcursionCategory = db.Column(db.String(50))
    Type = db.Column(db.String(50))

class PackingList(db.Model):
    ClothingCategory = db.Column(db.String(50))
    ClothingItem = db.Column(db.String(50))

# route to get holiday details
@app.route('/api/holiday', methods=['GET'])
def get_holiday():
    booking = Booking.query.first()  # For simplicity, get the first booking
    if booking:
        destination = Destination.query.get(booking.DestinationID)
        return jsonify({
            'destination': destination.Name,
            'start_date': booking.StartDate.strftime('%Y-%m-%d'),
            'end_date': booking.EndDate.strftime('%Y-%m-%d')
        })
    return jsonify({'error': 'No holiday found'}), 404

@app.route('/')
def index():
    return render_template('excursions.html')

@app.route('/api/excursions', methods=['GET'])
def get_excursions():
    excursions = Excursion.query.all()
    return jsonify([{
        'ExcursionID': e.ExcursionID,
        'ExcursionCategory': e.ExcursionCategory,
        'Type': e.Type
    } for e in excursions])

if __name__ == '__main__':
    app.run(debug=True)
