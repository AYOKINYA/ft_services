cat ip.txt
pure-ftpd -j -Y 2 -p 30020:30020 -p 30021:30021 -P $(cat ip.txt)