from fastapi import FastAPI

from pydantic_model.chat_body import ChatBody
from services.sort_source import SortSourceService
from services.search_service import SearchServices


app= FastAPI()
seach_service = SearchServices()
sort_source_service= SortSourceService()

@app.post("/chat")

def chat_endpoint(body: ChatBody):
   search_results= seach_service.web_search(body.query)
   sorted_results= sort_source_service.sort_sources(body.query,search_results)
   return body.query