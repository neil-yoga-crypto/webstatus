from time import strptime
from datetime import datetime
from datetime import date
import sys

def main(line):
    pieces = line.strip().split(" ")

    month = int(strptime(pieces[0],'%b').tm_mon)
    day = int(pieces[1])
    year = int(pieces[2])

    d1 = date(year,month,day)
    d2 = datetime.now().date()
    print(difDays(d1,d2))

def difDays(d1,d2):
    return (d1-d2).days

if __name__ == "__main__":
    if not sys.stdin.isatty():
        for line in sys.stdin:
            main(line)
    else:
        if len(sys.argv) != 2:
            print("Usage: python ssl-expiry-to-days.py [Date (format: Jan 30 2018)]")
            exit()
        else:
            main(sys.argv[1])
