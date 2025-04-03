#!/bin/bash

# Detect OS
OS="$(uname -s 2>/dev/null || echo 'Windows')"

# Set up virtual environment command based on OS
if [[ "$OS" == "Linux" || "$OS" == "Darwin" ]]; then
    ACTIVATE_CMD="source venv/bin/activate"
elif [[ "$OS" == "Windows" ]]; then
    ACTIVATE_CMD="venv\\Scripts\\activate"
else
    echo "❌ Unsupported OS"
    exit 1
fi

# Create project directory
PROJECT_DIR="bs_calendar_project"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit

# Set up virtual environment
python3 -m venv venv
eval "$ACTIVATE_CMD"

# Install necessary packages
pip install ics nepali-datetime

# Create the Python script
cat <<EOF > generate_bs_calendar.py
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
EOF

echo "✅ Python project created in $PROJECT_DIR"
echo "👉 To generate the .ics file, run:"
echo "   cd $PROJECT_DIR"
echo "   $ACTIVATE_CMD"
echo "   python generate_bs_calendar.py"
