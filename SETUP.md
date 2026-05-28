# Elite Eats - Food Delivery Website

A modern, full-featured food delivery web application with user authentication, shopping cart, favorites, and order management.

## Features

✨ **User Authentication**
- Registration with email and username
- Secure login with password hashing
- Session management
- Profile management

🛒 **Shopping**
- Browse recipes from DummyJSON API
- Search and filter functionality
- Category filtering
- Time range filtering
- Rating filter

❤️ **Favorites**
- Save favorite recipes
- Quick access to favorites
- Local storage persistence

📦 **Cart & Checkout**
- Add/remove items from cart
- Adjust quantities
- Checkout functionality
- Order history tracking

👤 **User Profile**
- View and edit profile information
- Update delivery address and phone
- View order history
- Track order status (pending, confirmed, delivered)

## Project Structure

```
API integration/
├── app.py                    # Flask backend application
├── requirements.txt          # Python dependencies
├── SETUP.md                  # This setup guide
└── templates/
    ├── login.html           # Login/registration page
    ├── index.html           # Main shopping page
    └── profile.html         # User profile page
```

## Tech Stack

- **Backend**: Flask 3.0.0
- **Database**: SQLite (via Flask-SQLAlchemy)
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **API**: DummyJSON Recipes API

## Installation & Running

### Step 1: Activate Virtual Environment
```bash
cd "c:\Users\Vedika\OneDrive\ドキュメント\API integration"
env\Scripts\activate
```

### Step 2: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Run the Application
```bash
python app.py
```

The application will start on `http://localhost:5000`

## First Time Setup

1. Navigate to http://localhost:5000
2. You'll be redirected to the login page
3. Click "Sign Up" to create a new account
4. Fill in your details:
   - First Name (optional)
   - Last Name (optional)
   - Email (required)
   - Username (required)
   - Password (minimum 6 characters)
5. Click "Sign Up" button
6. You'll be logged in automatically and redirected to the shopping page

## How to Use

### Browse & Shop
1. View available recipes on the main page
2. Use the search bar to find specific items
3. Filter by category, cooking time, and rating
4. Click "Add to cart" to add items

### Manage Cart
1. Click the 🛒 icon in the top right
2. Adjust quantities with +/- buttons
3. Click "Proceed to Checkout" to place order
4. Order is saved to your account

### Manage Favorites
1. Click the ❤ icon on any recipe card to add to favorites
2. Click the ❤ button in top right to view only favorites
3. Your favorites are saved automatically

### View Profile & Orders
1. Click on your username in top right
2. Click "My Profile"
3. View and edit your information
4. See complete order history with status

## Key Components

### Backend (Flask)
- User authentication and session management
- Database models for Users and Orders
- API endpoints for CRUD operations
- Password hashing for security

### Frontend
- Login/Registration page with tab switching
- Main shopping interface with filtering
- User profile page with order history
- Responsive design for all screen sizes

### Database
- SQLite database (app.db)
- User table with profile information
- Order table with items and status tracking

## Testing the Application

### Test Login
1. Create an account on the Sign Up page
2. Log out and log back in with your credentials

### Test Shopping
1. Browse recipes (loaded from DummyJSON API)
2. Search for "chicken" or "pizza"
3. Filter by category or time
4. Add items to cart

### Test Orders
1. Add items to cart
2. Click "Proceed to Checkout"
3. Go to "My Profile" to see order
4. Order appears with "pending" status

### Test Profile
1. Click username → "My Profile"
2. Update your first name, phone, address
3. Click "Save Changes"
4. Information is updated in database

## Troubleshooting

**Port 5000 already in use:**
- Change port in app.py: `app.run(port=5001)`

**Database errors:**
- Delete `app.db` and restart the app

**Module not found:**
- Run: `pip install -r requirements.txt --force-reinstall`

**Can't log in:**
- Make sure email and password are correct
- Passwords are case-sensitive

## Security Features

✅ Password hashing (Werkzeug)
✅ Session-based authentication
✅ SQL injection prevention
✅ Input validation
✅ Secure session management

## Next Steps

Your website is now ready! You can:
- Add more features (payments, reviews, ratings)
- Connect to a real database (MySQL, PostgreSQL)
- Deploy to a web server
- Add email notifications
- Implement admin dashboard
- Add recipe recommendations

---

**Version**: 1.0.0 - Full Website Edition
**Created**: May 28, 2026
**Status**: Ready to Use
