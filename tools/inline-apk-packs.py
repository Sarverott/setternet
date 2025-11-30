#from . import helpers

import csv
import pprint

gencode = ""

with open('tools/software-packages.csv', newline='') as csvfile:
    csvdata = csv.reader(csvfile, delimiter=' ', quotechar='`')
    #sc_help = helpers.SAFECOMMENT
    sc_help = ' \t # '
    with open('apps/install-script.sh', "w") as installer:
        installer.write(
            "\napk add --no-cache ".join(
                [sc_help.join(row) for row in csvdata]
            )
        )
    print("---")