# 2.MVC_Books_Library

## Steps to Run the Project 

## Variant 1

### 1. Select a Local Folder for the Project and Clone the Repository

```bash
git clone --filter=blob:none --no-checkout https://github.com/YaroslavRomaniuk/Node.JS-Backend-LVL3.git
```

### 2. Navigate to the Cloned Empty Repository

```bash
cd <FOLDER NAME>
```

### 3. Set Sparse Checkout

```bash
git sparse-checkout set --cone
```

### 4. Check Out the Specified Folder

```bash
git checkout main
```

### 5. Clone Project Folder

```bash
git sparse-checkout set 2.MVC_Books_Library/
```

### 6. Install Node.js and npm

If Node.js and npm are not installed, install them. You can download the installer from [nodejs.org](https://nodejs.org/) or use a package manager like `nvm` for installation.

### 7. Install MySQL

If MySQL is not installed, download it from [mysql.com](https://www.mysql.com/downloads/) or use a package manager.

**Note:** The database will be installed automatically after the server is running.

### 8. Create a `.env` File with the Following Structure

```env
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=rootpassword
MYSQL_DATABASE=mydatabase
PORT=3000
```

### 9. Install Dependencies

```bash
npm install
```

### 10. Access the Application

Open your browser and navigate to `http://localhost:3000`.

## Variant 2 (With Docker)

### 1. Ensure Docker Desktop is Installed

If Docker Desktop is not installed, you can download and install it from [Docker's official website](https://www.docker.com/products/docker-desktop).

### 2. Obtain the Docker Compose File

Contact the project maintainer to obtain the `docker-compose.yml` file necessary to run the project with Docker.

### 3. Prepare the Project Folder

Open your project folder where you want to run the Docker containers.

### 4. Copy the Docker Compose File

Copy the provided `docker-compose.yml` file into the root of your project folder.

### 5. Run Docker Compose

Open your terminal, navigate to the project folder, and run the following command:

```bash
docker-compose up --build
```

This command will build and start the Docker containers defined in the `docker-compose.yml` file.

### 6. Access the Application

Once the containers are up and running, open your browser and navigate to `http://localhost:5000` to access the application.


## Troubleshooting

### Common Issues and Solutions

1. **MySQL Connection Errors**

   - Ensure MySQL is running on your machine.
   - Double-check your `.env` file for correct MySQL credentials.
   - Verify that MySQL server is configured to accept connections from your application.

2. **Port Conflicts**

   - If port `3000` is already in use, change the `PORT` value in your `.env` file to an available port.
   - Restart your application after changing the port.

3. **Dependency Issues**

   - Run `npm install` to ensure all dependencies are installed.
   - If there are issues with specific dependencies, check the version compatibility in the `package.json` file.

4. **Database Initialization Errors**

   - Make sure your MySQL server allows the creation of new databases.
   - Verify that the `MYSQL_DATABASE` specified in your `.env` file does not already exist.

5. **Environment Variables**

   - Ensure your `.env` file is in the root directory of your project.
   - Verify that all required environment variables are correctly set in your `.env` file.

### Additional Help

If you have any questions or need further assistance, feel free to reach out.