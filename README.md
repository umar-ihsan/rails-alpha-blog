# Rails Alpha Blog

A full-featured blog application built with Ruby on Rails, featuring user authentication, article management, and categorization system.

## 🚀 Features

- **User Management**
  - User registration and authentication
  - Secure password hashing with bcrypt
  - Admin user privileges
  - User profiles with article listings

- **Article System**
  - Create, read, update, and delete articles
  - Article categorization (many-to-many relationship)
  - Pagination for article listings
  - User authorization (users can only edit their own articles)

- **Category Management**
  - Admin-only category creation and management
  - Article categorization with multiple categories per article
  - Category-based article filtering

- **Security & Authorization**
  - Session-based authentication
  - Role-based access control (admin vs regular users)
  - CSRF protection
  - Input validation and sanitization

## 🛠️ Technology Stack

- **Framework**: Ruby on Rails 8.0.2
- **Database**: SQLite3
- **Authentication**: bcrypt for password hashing
- **Frontend**: HTML/CSS with Turbo and Stimulus (Hotwire)
- **Pagination**: will_paginate gem
- **Web Server**: Puma
- **Asset Pipeline**: Propshaft

## 📋 Prerequisites

- Ruby 3.x
- Rails 8.x
- SQLite3
- Git

## 🔧 Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/umar-ihsan/rails-alpha-blog.git
   cd rails-alpha-blog
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the development server**
   ```bash
   rails server
   ```

5. **Access the application**
   Open your browser and navigate to `http://localhost:3000`

## 📊 Database Schema

### Users Table
- `name` (string) - User's full name
- `email` (string) - Unique email address
- `password_digest` (string) - Encrypted password
- `admin` (boolean) - Admin privileges flag

### Articles Table
- `title` (string) - Article title
- `content` (text) - Article content
- `user_id` (integer) - Foreign key to users table

### Categories Table
- `name` (string) - Category name (unique)

### Article Categories (Join Table)
- `article_id` (integer) - Foreign key to articles
- `category_id` (integer) - Foreign key to categories

## 🚪 Routes

### Public Routes
- `GET /` - Homepage
- `GET /about` - About page
- `GET /articles` - List all articles
- `GET /articles/:id` - View specific article
- `GET /signup` - User registration form
- `GET /login` - User login form
- `POST /login` - Process login
- `DELETE /logout` - User logout

### Authenticated Routes
- `GET /articles/new` - Create new article form
- `POST /articles` - Create article
- `GET /articles/:id/edit` - Edit article form (own articles only)
- `PATCH /articles/:id` - Update article (own articles only)
- `DELETE /articles/:id` - Delete article (own articles only)
- `GET /users/:id` - User profile
- `GET /users/:id/edit` - Edit user profile

### Admin Routes
- `GET /categories` - List categories
- `GET /categories/new` - Create category form
- `POST /categories` - Create category
- `GET /categories/:id/edit` - Edit category form
- `PATCH /categories/:id` - Update category
- `DELETE /categories/:id` - Delete category

## 🔐 Authentication & Authorization

### User Authentication
- Session-based authentication using Rails sessions
- Secure password storage with bcrypt
- Email validation with regex patterns
- Automatic email normalization (downcase and strip)

### Authorization Rules
- **Articles**: Users can only edit/delete their own articles (admin can edit/delete any)
- **Categories**: Only admins can create, edit, or delete categories
- **User Management**: Users can edit their own profiles

### Helper Methods
- `current_user` - Returns the currently logged-in user
- `logged_in?` - Checks if a user is logged in
- `require_user` - Before action to ensure user authentication
- `require_admin` - Before action to ensure admin privileges

## 🎨 Frontend Features

- Responsive design with modern CSS
- Flash message system for user feedback
- Pagination for article and category listings
- Form validation with error displays
- Navigation with authentication state awareness

## 📝 Model Validations

### Article Model
- Title: Required, 5-20 characters
- Content: Required, 10-100 characters
- Must belong to a user
- Can have multiple categories

### User Model
- Name: Required, 3-50 characters
- Email: Required, valid format, unique
- Password: Required (handled by has_secure_password)

### Category Model
- Name: Required, 3-25 characters, unique
- Must be capitalized when displayed

## 🔄 Development Workflow

1. **Running Tests**
   ```bash
   rails test
   ```

2. **Database Operations**
   ```bash
   rails db:migrate          # Run migrations
   rails db:rollback         # Rollback last migration
   rails db:reset            # Reset database
   rails db:seed             # Seed database
   ```

3. **Console Access**
   ```bash
   rails console
   ```

4. **View Routes**
   ```bash
   rails routes
   ```

## 🐳 Docker Support

The application includes Docker configuration:

```bash
# Build the image
docker build -t rails-alpha-blog .

# Run the container
docker run -p 3000:3000 rails-alpha-blog
```

## 📁 Project Structure

```
app/
├── controllers/        # Application controllers
├── models/            # Data models
├── views/             # View templates
├── helpers/           # View helpers
└── assets/           # Stylesheets and images

config/
├── routes.rb         # Application routes
├── database.yml      # Database configuration
└── environments/     # Environment-specific configs

db/
├── migrate/          # Database migrations
├── schema.rb         # Current database schema
└── seeds.rb          # Seed data

test/                 # Test suite
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

**Umar Ihsan**
- GitHub: [@umar-ihsan](https://github.com/umar-ihsan)

## 🙏 Acknowledgments

- Built with Ruby on Rails
- Inspired by modern blogging platforms
- Uses Rails best practices and conventions
