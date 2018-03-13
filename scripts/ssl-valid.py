import requests
import sys

def main(line):
    domain = line.strip()
    try:
        requests.get("https://%s" % domain)
        print("1")
    except Exception:
        print("0")

if __name__ == "__main__":
    if not sys.stdin.isatty():
        for line in sys.stdin:
            main(line)
    else:
        if len(sys.argv) != 2:
            print("Usage: python ssl-valid.py [domain]")
            exit()
        else:
            main(sys.argv[1])



