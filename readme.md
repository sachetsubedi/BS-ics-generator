### This is a project that generates a .ics (ICalendar) file for B.S. dates and maps it to the corresponding A.D. dates as events.

### Contents:

- [Project Overview](#project-overview)
- [Usage](#usage)
  - [Method 1: Manually seting up python env](#method-1-manually-seting-up-python-env)
  - [Method 2: Copy the pre-built virtual environment](#method-2-copy-the-pre-built-virtual-environment)
  - [Method 3: Use generated .ics file](#method-3-use-generated-ics-file)
- [Customization](#cutomization)

## Usage:

### Method 1: Manually seting up python env

1. Download the `setup.sh` file from the repository or copy its content and save the file as `setup.sh`.
   <br>
2. Make the script executable by running the following command in your terminal:

```bash
chmod +x setup.sh
```

<br>

3. Run the script to set up the virtual environment and install the required packages:

```bash
./setup.sh
```

<br>

4. Activate the virtual environment:

```bash
cd bs_calendar_project
source venv/bin/activate
```

<br>

5. Run the python script to generate the .ics file:

```bash
python bs_calendar.py
```

<br>

### Method 2: Copy the pre-built virtual environment

1. Download the `bs_calandar_project` folder from the repository.

   <br>

2. Activate the virtual environment:

```bash
cd bs_calendar_project
source venv/bin/activate
```

<br>

3. Run the python script to generate the .ics file:

```bash
python bs_calendar.py
```

<br>

### Method 3: Use generated .ics file

1. Download the `bs_calandar_project/bs_calendar.ics` file from the repository. This file contains generated calandar events upto 2030.

<br>

### Cutomization:

1. Open the `bs_calendar.py` file in a text editor.
   <br>

2. Modify the `start_date` and `end_date` variables to set the desired date range for the events.
   ```python
   start_date = datetime(2023, 1, 1)
   end_date = datetime(2030, 12, 31)
   ```
   <br>
3. Modify month names in the `NEPALI_MONTHS` list if you want to change the month names in the generated .ics file.
   ```python
   NEPALI_MONTHS = [
       "","Baisakh", "Jestha", "Ashad", "Shrawan", "Bhadra", "Ashwin",
       "Kartik", "Mangsir", "Poush", "Magh", "Falgun", "Chaitra"
   ]
   ```
