# perplexity_clone

## Demo
### Demo Link: https://perplexity-clone-4761e.web.app
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/cf4b6819-ef3e-48cf-b999-08d41d2f94d1" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/cebba6be-4339-4843-aa79-1c36e6d29b45" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/38730493-cb1a-4fe6-a332-27d009684c76" width="200"/></td>
  </tr>
</table>




https://github.com/user-attachments/assets/c02f2b25-298e-4abf-8426-3a570e15f7be






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
