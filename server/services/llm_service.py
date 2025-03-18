from typing import List
import google.generativeai as genai
import os

from config import Settings

class LLMService:
    settings= Settings()
    genai.configure(api_key=settings.GEMINI_API)
    generation_config = {
    "temperature": 1,
    "top_p": 0.95,
    "top_k": 40,
    "max_output_tokens": 8192,
    "response_mime_type": "text/plain",
}
    model= genai.GenerativeModel(model_name="gemini-2.0-flash",generation_config=generation_config)
    chat_session = model.start_chat(
    history=[
    ])


    def generate_response(self, query: str, search_results: List[dict]):
        if not search_results:  # Check if None or empty list
         return "No relevant search results found to generate a response."

        context_text = "\n\n".join([
        f"Source {i+1} ({result['url']}): \n{result['content']}"
        for i, result in enumerate(search_results)
     ])

        full_prompt = f"""
        Context from Web Search:
        {context_text}

        Query: {query}
        Please provide a comprehensive, detailed, well-cited accurate response using the above context.
        Think and reason deeply. Ensure it answers the query the user is asking. 
        Do not use your knowledge until it is absolutely necessary.
        """

        response = self.chat_session.send_message(full_prompt,stream=True)
        
        for chunk in response:
            yield chunk.text
