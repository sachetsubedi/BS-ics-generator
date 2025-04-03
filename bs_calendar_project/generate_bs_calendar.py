from datetime import date, timedelta
from ics import Calendar, Event
import nepali_datetime

NEPALI_MONTHS = [
    "", "Baishakh", "Jestha", "Ashadh", "Shrawan",
    "Bhadra", "Ashwin", "Kartik", "Mangsir",
    "Poush", "Magh", "Falgun", "Chaitra"
]

start_date = date(2025, 4, 1)
end_date = date(2030, 4, 1)

calendar = Calendar()

current_date = start_date
while current_date < end_date:
    bs_date = nepali_datetime.date.from_datetime_date(current_date)
    event_title = f"{bs_date.day} {NEPALI_MONTHS[bs_date.month]} {bs_date.year}"

    event = Event()
    event.name = event_title
    event.begin = current_date.isoformat()
    event.make_all_day()

    calendar.events.add(event)
    current_date += timedelta(days=1)

with open("bs_calendar.ics", "w") as f:
    f.writelines(calendar)

print("✅ bs_calendar.ics has been created!")
