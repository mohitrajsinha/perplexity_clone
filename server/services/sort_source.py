from typing import List
from sentence_transformers import SentenceTransformer
import numpy as np

class SortSourceService:
    model = SentenceTransformer("all-MiniLM-L6-v2")

    def sort_sources(self, query: str, searchResults: List[dict]):
        query_embedding = self.model.encode(query)
        relevant_docs = []

        for result in searchResults:
            # Check if 'content' is a string
            if not isinstance(result.get("content"), str):
                print(f"Skipping invalid content: {result.get('content')} (type: {type(result.get('content'))})")
                continue

            result_embedding = self.model.encode(result["content"])
            similarity= float(self.model.similarity(query_embedding, result_embedding))

            result['relevance_score'] = similarity
            if similarity > 0.4:
                relevant_docs.append(result)

        return sorted(relevant_docs, key=lambda x: x['relevance_score'], reverse=True)        

            