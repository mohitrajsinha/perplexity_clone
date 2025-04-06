from config import Settings
from tavily import TavilyClient
import trafilatura


settings= Settings()
client = TavilyClient(api_key=settings.TAVILY_API_KEY)

class SearchServices:
    def web_search(self, query:str):
        results= []
        response= client.search(query,max_results=10)
        search_results= response.get("results",[])

        for result in search_results:
            downlaoded_text= trafilatura.fetch_url(result.get("url"))
            content = trafilatura.extract(downlaoded_text,include_comments=False)
            results.append({
                "title": result.get("title",""),
                "url": result.get("url",""),
                "content": content
            })
        return results

        
