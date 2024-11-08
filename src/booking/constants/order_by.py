from typing import Literal

BOOKING_ORDER_BY = {
    "-from_date": "from_date DESC",
    "from_date": "from_date ASC",
    "-to_date": "to_date DESC",
    "to_date": "to_date ASC",
    "-id": "id DESC",
    "id": "id ASC",
}

BOOKING_SORT_BY_OPTIONS = Literal["-from_date", "from_date", "-to_date", "to_date", "-id", "id"]
