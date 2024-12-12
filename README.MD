# Medingen Task

**Project Structure**

* **backend**
    * `server.py`: Flask application code, handling API endpoints.
    * `medigenDB_dump.sql`: SQL dump file containing database schema and sample data.
* **client/medingen-app**
    * React components and logic for the frontend user interface.
* **database**
    * `DatabaseTable.txt`: SQL commands used to create, update, and populate database tables.

**Getting Started**

**1. Backend Setup**

    * **Run the Flask Server**
        ```bash
        cd bakend
        pip install -r requirements.txt
        python3 server.py
        ```

**2. Frontend Setup**

    * **Navigate to Frontend Directory**
        ```bash
        cd client/medingen-app
        ```
    * **Install Dependencies**
        ```bash
        yarn install
        ```
    * **Start Development Server**
        ```bash
        yarn start
        ```
    * Access the application in your web browser (usually at `http://localhost:3000`).

**Database Notes**

* Refer to `database/db_commands.txt` for database table creation and updates.
