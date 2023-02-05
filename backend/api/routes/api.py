from fastapi import APIRouter

from api.routes import post
from api.routes import query

router = APIRouter()

router.include_router(post.router, tags=["post"], prefix="/post")
router.include_router(query.router, tags=["query"], prefix="/query")
