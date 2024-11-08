from fastapi import FastAPI

from src.hotels.routes import router as management_router
from src.clients.routes import router as client_router
from src.booking.routes import router as booking_router


def get_application():
    _app = FastAPI()
    _app.include_router(router=management_router, prefix='/hotels')
    _app.include_router(router=client_router, prefix='/clients')
    _app.include_router(router=booking_router, prefix='/booking')
    return _app
