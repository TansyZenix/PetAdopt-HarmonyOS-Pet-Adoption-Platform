# Sample Data

This directory contains anonymized sample data files for reference.
These are **not** imported automatically - you need to manually import them into MongoDB if needed.

## Collections

- `users.json` - User accounts
- `pet_collections.json` - Pet listings for adoption
- `hospitals.json` - Cooperative hospitals
- `shops.json` - Pet supply shops

## Import to MongoDB

```bash
mongoimport --db pets --collection users --file users.json --jsonArray
mongoimport --db pets --collection pet_collection --file pet_collections.json --jsonArray
mongoimport --db pets --collection hospitals --file hospitals.json --jsonArray
mongoimport --db pets --collection shops --file shops.json --jsonArray
```
