# FastAPI AI Model Access with API Key and Credit Management

This FastAPI application provides access to an AI model, allowing users to generate responses based on their input prompts. Access to the AI model is secured using API key authentication, and a credit system is implemented to manage usage. 

## Features

- **API Key Authentication**: Only users with a valid API key can access the service.
- **Credit System**: Each user starts with 5 credits, and each request deducts one credit.
- **AI Model Integration**: The application interacts with the `ollama` API (with the "mistral" model) to generate responses based on user input.

## Installation

1. Clone the repository:
    ```bash
    git clone <repo_url>
    cd <repo_directory>
    ```

2. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```

3. Create a `.env` file and add your API key:
    ```bash
    API_KEY=<your_api_key_here>
    ```

4. Run the FastAPI application:
    ```bash
    uvicorn main:app --reload
    ```

## Code Explanation

### 1. **Importing Necessary Libraries**
```python
from fastapi import FastAPI, Depends, HTTPException, Header
import ollama
import os
from dotenv import load_dotenv
