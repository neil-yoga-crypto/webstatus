from time import strptime
from datetime import datetime
from datetime import date
import sys

def main(line):
    d1 = datetime.strptime(line.strip(), "%Y-%m-%d").date()
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
            print("Usage: python whois-expiry-to-days.py [Date (format: 2018-01-30)]")
            exit()
        else:
            main(sys.argv[1])
