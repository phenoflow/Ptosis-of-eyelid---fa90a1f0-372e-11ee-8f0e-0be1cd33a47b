# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"2BE2.00","system":"readv2"},{"code":"2BEZ.00","system":"readv2"},{"code":"F4E3000","system":"readv2"},{"code":"F4E3100","system":"readv2"},{"code":"F4E3200","system":"readv2"},{"code":"F4E3300","system":"readv2"},{"code":"F4E3z00","system":"readv2"},{"code":"P360.00","system":"readv2"},{"code":"1633.0","system":"med"},{"code":"16690.0","system":"med"},{"code":"17472.0","system":"med"},{"code":"17923.0","system":"med"},{"code":"17932.0","system":"med"},{"code":"22097.0","system":"med"},{"code":"2232.0","system":"med"},{"code":"27441.0","system":"med"},{"code":"35069.0","system":"med"},{"code":"35130.0","system":"med"},{"code":"36100.0","system":"med"},{"code":"38413.0","system":"med"},{"code":"38956.0","system":"med"},{"code":"4141.0","system":"med"},{"code":"43924.0","system":"med"},{"code":"47614.0","system":"med"},{"code":"49096.0","system":"med"},{"code":"66515.0","system":"med"},{"code":"8319.0","system":"med"},{"code":"8696.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ptosis-of-eyelid-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ptosis-of-eyelid---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ptosis-of-eyelid---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ptosis-of-eyelid---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
