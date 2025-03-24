# perplexity_clone

## Project Overview

This project is a clone of Perplexity AI, built using Python for the backend with FastAPI and Flutter for the frontend. It allows users to ask questions and receive answers based on online sources.

## Technologies Used

- **Backend:** Python with FastAPI
- **Frontend:** Flutter
- **AI Integration:** [Gemini AI]

## How to Set Up and Run the Project

### Step 1: Install Dependencies

First, install all the required dependencies using pip:

```bash
pip install -r requirements.txt
```

### Step 2: Create API Keys

1. **Tavily API Key:**
   - Go to [Tavily](https://tavily.com) and create an account.
   - Navigate to your dashboard to obtain your API key.
   
2. **Gemini API Key:**
   - Sign up for a Gemini AI account to get your API key.

### Step 3: Create a `.env` File

Create a `.env` file in the root directory of your project and add your API keys:

```text
TAVILY_API_KEY="your_tavily_api_key_here"
GEMINI_API="your_gemini_api_key_here"
```

Replace `"your_tavily_api_key_here"` and `"your_gemini_api_key_here"` with your actual API keys.

### Step 4: Run the Backend

```bash
cd server
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

### Step 5: Run the Frontend

```bash
cd ..
flutter run
```
