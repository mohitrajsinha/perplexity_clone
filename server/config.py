from pydantic_settings import BaseSettings
import os


class Settings(BaseSettings):
    TAVILY_API_KEY: str= os.getenv("TAVILY_API_KEY")
    GEMINI_API: str= os.getenv("GEMINI_API_KEY")
