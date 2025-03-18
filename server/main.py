import asyncio
from fastapi import FastAPI, WebSocket

from pydantic_model.chat_body import ChatBody
from services.llm_service import LLMService
from services.sort_source import SortSourceService
from services.search_service import SearchServices


app= FastAPI()
seach_service = SearchServices()
sort_source_service= SortSourceService()
llm_service= LLMService()

@app.websocket("/ws")
async def websocket_endpoint(websocket:WebSocket):
   await websocket.accept()

   try:
      await asyncio.sleep(0.1)
      data= await websocket.receive_json()
      query= data.get("query")
      search_results= seach_service.web_search(query)
      sorted_results= sort_source_service.sort_sources(query,search_results)
      await asyncio.sleep(0.1)
      await websocket.send_json({"type": "search_results","data": sorted_results})
      for chunk in llm_service.generate_response(query,sorted_results):
         await asyncio.sleep(0.1)
         await websocket.send_json({"type": "response","data": chunk})
   except:
      print("Unexpected Error occured")
   finally:
      await websocket.close()   


@app.post("/chat")

def chat_endpoint(body: ChatBody):
   search_results= seach_service.web_search(body.query)
   sorted_results= sort_source_service.sort_sources(body.query,search_results)
   response = llm_service.generate_response(body.query,sorted_results)
   return response