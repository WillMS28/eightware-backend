# Eightware Backend – Authentication API

This is a Ruby on Rails 7.2 API implementing JWT authentication using Devise and RSpec for testing.

---

## 📦 Requirements

- Ruby 3.3+
- Rails 7.2+
- PostgreSQL
- Bundler (`gem install bundler`)
- Node.js & Yarn (for Rails dependencies)
- [dotenv](https://github.com/bkeepers/dotenv) for managing environment variables

---

## 🚀 Setup

### 1. Clone the repo

```bash
git clone https://github.com/WillMS28/eightware-backend.git
cd eightware-backend
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Set up environment variables

Create a `.env` file at the root of the project:

```
POSTGRES_PASSWORD=your_postgres_password
```

> Make sure the password matches your local PostgreSQL setup.

---

## 🛠️ Database setup

Create and migrate the database:

```bash
bundle exec rails db:create db:migrate
```

---

## ✅ Tests

This project was developed following a TDD approach. Automated tests cover the main authentication flows.

### 🔧 Backend (RSpec)

To run the tests:

```bash
bundle exec rspec
```

The test suite includes the following scenarios:

📦 Model Tests
User model

Validates presence and format of email

Validates password (via Devise)

🔁 Request Tests
POST /signup

Creates a new user with valid data

Returns a JWT token in the response body

POST /login

Authenticates a user with correct credentials and returns JWT

Returns 401 Unauthorized with invalid credentials

GET /me

Returns user data when provided a valid JWT

Returns 401 Unauthorized without a valid token

Tests are implemented in the following files:

spec/models/user_spec.rb

spec/requests/auth_spec.rb

All tests must pass to ensure the app is working correctly.

---

## 🔐 API Endpoints

| Method | Endpoint      | Description             |
|--------|---------------|-------------------------|
| POST   | `/signup`     | Register new user       |
| POST   | `/login`      | Authenticate user       |
| GET    | `/me`         | Get current user (JWT)  |

All protected routes require an `Authorization` header with the JWT token.

```
Authorization: Bearer <your_token>
```

---

## 🧪 Technologies

- Ruby on Rails 7.2
- PostgreSQL
- Devise + devise-jwt
- RSpec
- dotenv-rails

---

## 📁 Project Structure

```
app/
├── controllers/
│   └── auth_controller.rb
├── models/
│   └── user.rb
spec/
├── models/user_spec.rb
├── requests/auth_spec.rb
```

---

## 🧑 Author

Made by William Miranda for the Eightware technical challenge.