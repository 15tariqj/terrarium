from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from core.settings.settings import get_settings

from core.events import create_start_app_handler
from api.routes.api import router as api_router


settings = get_settings()

app = FastAPI(
    title=settings.APP_NAME
)
# Configuring CORS policies
origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Instantiate backend routes
app.include_router(api_router)

# Event handlers
app.add_event_handler("startup", create_start_app_handler(app))
