# PetAdopt - HarmonyOS Pet Adoption Platform

A comprehensive pet adoption and rescue platform built with **HarmonyOS (ArkTS)** for the frontend and **Node.js (Express) + MongoDB** for the backend.

## Overview

PetAdopt connects pet rescuers, adopters, and animal lovers. It provides a multi-tab interface for browsing pets available for adoption, posting lost pet reports, joining community discussions, and accessing pet-related services.

## Features

### Home
- **Pet browsing** with pagination and category filtering (stray rescue / domestic pets)
- **Detailed pet profiles** showing age, gender, medical status (vaccination, deworming, sterilization), story, adoption requirements
- **Quick access** to pet search, cooperative hospitals, shopping, and community features

### Publish
- **Post pets for adoption** with detailed info, medical records, and contact details
- **Lost pet reports** with reward amount, location, and contact info
- **Pet registration** for tracking and community features

### Community
- **Discussion/Science** posts about pet care
- **Rescue stories** and救助 cases
- **Photo sharing** with image grids
- **Item exchange** for pet supplies
- **Post creation** with text and images

### My Profile
- **User info** with avatar and personal details
- **Notifications** about pet activities
- **Posts management** - view your published content
- **Favorites collection**
- **Help & feedback**, **Platform rules**, **Adoption agreement**
- **Volunteer contact**, **User blacklist** for safety
- **Pet supply shopping** with product listings
- **Service account** subscription

### Additional Features
- **Cooperative hospital directory** with location and contact info
- **Affordable pet supply mall**
- **Communication groups** for pet lovers
- **Adoption details** with full pet stories and requirements

## Tech Stack

### Frontend (HarmonyOS App)
- **Language**: ArkTS (TypeScript-based)
- **Framework**: HarmonyOS ArkUI
- **UI Components**: Custom components with @Builder decorators
- **HTTP Client**: @kit.NetworkKit (http)
- **Build**: HarmonyOS SDK with hvigor

### Backend (Server)
- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: MongoDB with Mongoose ODM
- **Authentication**: JWT (JSON Web Tokens)
- **Password Handling**: bcryptjs

## Project Structure

```
PetAdopt-HarmonyOS/
├── server/                          # Backend server
│   ├── app.js                       # Express app entry
│   ├── bin/www                      # Server startup script
│   ├── package.json                 # Dependencies
│   ├── database/
│   │   ├── connect.js               # MongoDB connection (pets DB)
│   │   ├── connect01.js             # Alternative connection
│   │   ├── deliverConnect.js        # MongoDB connection (deliver2 DB)
│   │   └── model/
│   │       ├── userModel.js         # User schema
│   │       ├── pets_model.js        # Pet collection schema
│   │       ├── PetModel.js          # Pet model (adoption)
│   │       ├── deliver2Model.js     # Lost pet report schema
│   │       ├── community.js         # Community post schema
│   │       ├── bannedModel.js       # Blacklist schema
│   │       ├── shop.js              # Shop product schema
│   │       └── hospital.js          # Hospital schema
│   ├── routes/
│   │   ├── myuser.js                # User auth & management
│   │   ├── my_pet.js                # Pet listing & search
│   │   ├── petRoutes.js             # Pet submission
│   │   ├── deliver2.js              # Lost pet reports
│   │   ├── community.js             # Community posts
│   │   ├── mylist.js                # Blacklist queries
│   │   ├── shop.js                  # Shop products
│   │   ├── hospital.js              # Hospital directory
│   │   ├── index.js                 # Home route
│   │   └── users.js                 # Users route
│   ├── utils/
│   │   └── Token.js                 # JWT helper
│   └── public/                      # Static files
│
├── harmonyos-app/                   # HarmonyOS client
│   ├── AppScope/
│   ├── entry/src/main/ets/
│   │   ├── entryability/            # App entry ability
│   │   ├── services/
│   │   │   └── request.ets          # HTTP request service
│   │   ├── types/
│   │   │   └── index.ets            # Type definitions
│   │   └── pages/
│   │       ├── Index.ets            # Legacy home page
│   │       ├── Login.ets            # Login screen
│   │       ├── Home/                # Home components
│   │       │   ├── HomeHeader.ets
│   │       │   ├── HomeIndex.ets
│   │       │   ├── HomeList.ets
│   │       │   └── HomeMenu.ets
│   │       └── my_project/
│   │           ├── front.ets                    # Main tab navigation
│   │           ├── main_page.ets                # Home page with pet list
│   │           ├── adoption_details_page.ets    # Pet adoption detail
│   │           ├── affordable_mall_page.ets     # Pet supply mall
│   │           ├── communication_group_page.ets # Groups page
│   │           ├── account/                     # User profile module
│   │           ├── community/                   # Community module
│   │           ├── publish/                     # Publishing module
│   │           └── rescue/                      # Rescue/adoption module
│   ├── hvigor/                     # Build configuration
│   ├── build-profile.json5
│   └── hvigorfile.ts
│
├── data/
│   └── samples/                    # Anonymized sample data for MongoDB
│
└── README.md
```

## Getting Started

### Prerequisites

- **Node.js** (v16 or later)
- **MongoDB** (v6 or later)
- **HarmonyOS DevEco Studio** (for client development)
- **npm** or **yarn**

### Backend Setup

1. Navigate to the server directory:
   ```bash
   cd server
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Ensure MongoDB is running on `localhost:27017`

4. Start the server:
   ```bash
   npm start
   # or
   npm run dev
   ```

   The server will start on port `8888` by default.
   Set the `PORT` environment variable to change the port.

5. (Optional) Import sample data:
   ```bash
   cd ../data/samples
   mongoimport --db pets --collection users --file users.json --jsonArray
   mongoimport --db pets --collection pet_collection --file pet_collections.json --jsonArray
   mongoimport --db pets --collection hospitals --file hospitals.json --jsonArray
   mongoimport --db pets --collection shops --file shops.json --jsonArray
   ```

### Client Setup

1. Open **DevEco Studio**
2. Open the `harmonyos-app/` directory as a project
3. Configure the API base URL in `entry/src/main/ets/services/request.ets`:
   ```typescript
   const base_url = "http://your-server-ip:8888";
   ```
4. Build and run on a HarmonyOS device or emulator

### Configuration

**JWT Secret**: The server uses a JWT secret for authentication tokens.
Set it via environment variable:
```bash
export JWT_SECRET=your-secure-secret-key
```
Default: `pet-adopt-platform-secret` (change in production)

**Database**: Connections are configured for `localhost:27017` by default.
Modify `server/database/*.js` files to change connection settings.

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/loginAndRegister/login` | POST | User login |
| `/loginAndRegister/add` | POST | Register user |
| `/loginAndRegister/user` | GET | Query users |
| `/loginAndRegister/updateuser` | PUT | Update user |
| `/loginAndRegister/deluser` | DELETE | Delete user |
| `/loginAndRegister/apliy` | POST | Mock payment |
| `/mypet/` | GET | List pets (with pagination) |
| `/mypet/getPetById` | GET | Get pet details |
| `/petRoutes/petsongyang` | POST | Submit pet for adoption |
| `/deliver2/deliver2` | POST | Post lost pet report |
| `/community/` | GET | List community posts |
| `/community/getByName` | GET | Get post by username |
| `/banned_lists/getAll` | GET | Get blacklist |
| `/banned_lists/getbyName` | GET | Search blacklist by name |
| `/shop/` | GET | List shop products |
| `/hospital/` | GET | List hospitals |

## License

This project is developed for educational purposes.
