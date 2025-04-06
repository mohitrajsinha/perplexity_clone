import asyncio
from fastapi import FastAPI, WebSocket
import logging

from pydantic_model.chat_body import ChatBody
from services.llm_service import LLMService
from services.sort_source import SortSourceService
from services.search_service import SearchServices

app= FastAPI()
seach_service = SearchServices()
sort_source_service= SortSourceService()
llm_service= LLMService()
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)
@app.get("/")
def greet_json():
    return {"Hello": "World!"}

@app.websocket("/ws")
async def websocket_endpoint(websocket:WebSocket):
   logger.debug("WebSocket connection initiated")
   await websocket.accept()

   try:
      await asyncio.sleep(0.1)
      data= await websocket.receive_json()
      query= data.get("query")
      logger.debug(f"Received query: {query}")
      search_results= seach_service.web_search(query)
      print('search_results')
      sorted_results= sort_source_service.sort_sources(query,search_results)
      logger.debug(f"Sorted results")
      await asyncio.sleep(0.1)
      await websocket.send_json({"type": "search_results","data": sorted_results})
      for chunk in llm_service.generate_response(query,sorted_results):
         logger.debug(f"Generated response")
         await asyncio.sleep(0.1)
         await websocket.send_json({"type": "response","data": chunk})
   except Exception as e:
      print("Unexpected Error occured", e)
   finally:
      await websocket.close()   


@app.post("/chat")

def chat_endpoint(body: ChatBody):
   search_results= seach_service.web_search(body.query)
   sorted_results= sort_source_service.sort_sources(body.query,search_results)
   response = llm_service.generate_response(body.query,sorted_results)
   return response