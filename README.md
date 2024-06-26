# Ntex Rust Template

This template provides a robust starting point for building web services with [Ntex](https://github.com/ntex-rs/ntex), an asynchronous web framework for Rust. Ntex aims to facilitate the development of high-performance, scalable web services with minimal boilerplate code.

## Features

1. **Asynchronous Web Framework:**
    - Utilizes Ntex, a high-performance async web framework designed for Rust, ensuring efficient handling of I/O-bound operations and a non-blocking server architecture.
2. **Serde Integration:**
    - Fully integrates with Serde for robust data serialization and deserialization. This feature simplifies exchanging JSON data between servers and clients, seamlessly mapping Rust structures to JSON format and vice versa.
3. **CORS Support:**
    - Configured with `ntex-cors`, which facilitates handling Cross-Origin Resource Sharing (CORS). This allows your web services to be securely accessible from different domains, essential for modern web applications that interact with multiple services.
4. **Environment Logging:**
    - Incorporates `pretty_env_logger`, an environment-aware logger for detailed and configurable logging that helps in monitoring and debugging the application efficiently during development and in production.
5. **Configuration Management:**
    - Uses `dotenvy` to manage environment variables through a `.env` file, streamlining the configuration process and ensuring sensitive credentials are kept out of the code.
6. **State Management:**
    - Implements state management using `Arc<>` to share state across multiple handlers, enabling efficient data sharing and synchronization between different parts of the application.
7. **CRUD API Endpoints:**
    - Provides built-in CRUD (Create, Read, Update, Delete) operations for user entities via RESTful endpoints, demonstrating practical usage of database operations (Prisma Client) within the Ntex framework.
8. **Docker Support:**
    - Includes Docker configurations for both development and production environments, ensuring easy setup and deployability across different systems with containerization technology.
9. **Automated Testing:**
    - Comes with a pre-configured test module using Ntex's test framework, which facilitates automated testing of your endpoints and helps maintain code quality and reliability.

## Prerequisites

-   **Rust**: Ensure you have Rust installed on your system. If not, you can install it from the [official Rust website](https://www.rust-lang.org/tools/install).

## Quick Start

### Clone the Repository

```bash
git clone https://github.com/ViniciosLugli/ntex-rust-template.git
cd ntex-rust-template
```

### Set Up the Environment

Create a `.env` file in the root directory of the project to manage environment variables easily:

```plaintext
# Server log level
RUST_LOG=info

# Database URL of docker container
DATABASE_URL="postgresql://postgres:postgres@postgres:5432/postgres?schema=public"
```

### Build and Run

Generate the database schema using:

```bash
cargo prisma generate
```

Build and run the development server using:

```bash
cargo run
```

> Or you can use `cargo run --release` for a deployment-ready build.

The server will start at `http://0.0.0.0:3000`. You can access the service using a browser or a tool like curl:

```bash
curl http://localhost:3000
```

> You should see a greeting message from the server. For more API endpoints, refer to the [API Endpoints Overview](#api-endpoints-overview) section.

### Using Docker for Development

To use Docker for development, ensure you have Docker installed, then run:

```bash
docker-compose -f docker-compose-dev.yml up --build
```

This command builds the application using Docker and runs it alongside a Postgres database container.

### Using Docker for Deployment

For deploying the application with Docker, use:

```bash
docker-compose -f docker-compose-prod.yml up --build
```

This setup is optimized for production by minimizing rebuild times and ensuring the application runs efficiently.

## Using Docker for Testing

The project includes a test suite of all the endpoints. You can run the tests using:

```bash
docker-compose -f docker-compose-test.yml up --build
```

## API Endpoints Overview

The template provides a set of RESTful endpoints for managing user data, including creating, retrieving, and deleting users. Below are the specifications and examples for each.

### 1. Home Endpoint

**Endpoint**: `/`

**Method**: GET

**Description**: Returns a greeting message.

**CURL Command**:

```bash
curl http://localhost:3000
```

**Sample Response**:

```json
{
	"message": "Hello world!"
}
```

### 2. Get Users

**Endpoint**: `/user`

**Method**: GET

**Description**: Retrieves a list of all users.

**CURL Command**:

```bash
curl http://localhost:3000/user
```

**Sample Response**:

```json
[
	{
		"id": 1,
		"name": "Alice Johnson",
		"email": "alice@example.com"
	},
	{
		"id": 2,
		"name": "Bob Smith",
		"email": "bob@example.com"
	}
]
```

### 3. Create User

**Endpoint**: `/user`

**Method**: POST

**Description**: Creates a new user with the provided name and email.

**CURL Command**:

```bash
curl -X POST http://localhost:3000/user \
     -H 'Content-Type: application/json' \
     -d '{"name": "Charlie Brown", "email": "charlie@example.com"}'
```

**Sample Response**:

```json
{
	"id": 3,
	"name": "Charlie Brown",
	"email": "charlie@example.com"
}
```

### 4. Delete User

**Endpoint**: `/user/{id}`

**Method**: DELETE

**Description**: Deletes a user based on the provided user ID.

**CURL Command**:

```bash
curl -X DELETE http://localhost:3000/user/3
```

**Sample Response**:

```json
{
	"id": 3,
	"name": "Charlie Brown",
	"email": "charlie@example.com"
}
```
