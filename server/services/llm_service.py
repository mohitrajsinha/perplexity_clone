from typing import List
from google import genai
from config import Settings

class LLMService:
    settings= Settings()
#     genai.configure(api_key=settings.GEMINI_API)
#     generation_config = {
#     "temperature": 1,
#     "top_p": 0.95,
#     "top_k": 40,
#     "max_output_tokens": 8192,
#     "response_mime_type": "text/plain",
# }
    # model= genai.GenerativeModel(model_name="gemini-2.0-flash",generation_config=generation_config)
    # chat_session = model.start_chat(
    # history=[
    # ])

    client = genai.Client(api_key=settings.GEMINI_API)



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
        try:
            response = self.client.models.generate_content(model="gemini-2.0-flash", contents=full_prompt)
        except Exception as e:
            print("Error occurred:", e)
        lo    


        # Correct way to extract text
        if hasattr(response, 'text'):
            yield response.text  # ✅ Extract and return the text response
        else:
            print("Response object does not contain 'text' attribute:", response)

