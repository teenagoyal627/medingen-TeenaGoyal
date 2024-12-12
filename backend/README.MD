## Backend for Medingen

Run: python3 server.py

## My_Sql server
Used Aivin to host a live my_sql server.

## Created user 
```
curl -X POST http://localhost:5000/signup \
  -H "Content-Type: application/json" \
  -d '{"email": "admin@medigne.com", "password": "test123"}'
  ```