# coding: utf-8
import sys
import urllib2
import re
from bs4 import BeautifulSoup
from datetime import datetime

URL="http://repo.continuum.io/miniconda/"
soup = BeautifulSoup(urllib2.urlopen(URL).read())
date_url = {}
table = soup.find("table")
links = table.find_all("a",href=re.compile("Miniconda3.*inux-x86_64"))
for link in links:
    l = URL+link.get("href").strip("./")
    date = datetime.strptime(link.parent.next_sibling.next_sibling.next_sibling.next_sibling.next_element, "%Y-%m-%d %H:%M:%S")
    date_url[date] = l
print >> sys.stdout, date_url[max(date_url)]

