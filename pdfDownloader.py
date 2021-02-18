import requests
pdf_path = "assets/pdfs/papers"
data = open("pdf_info.txt")
pdf = ""

PMC_List = []
PMID_List = []
PDF_List = []
SO_List = []
x = ""

for line in data:
    if "PMC -" in line:
        PMC_List.append(line[6:].strip('\n'))
    if "PMID-" in line:
        PMID_List.append(line[6:].strip('\n'))
        print(line[6:].strip('\n'))
    if "SO " in line:
        SO_List.append(line[6:].strip('\n')+'')

with open(str("PMID_List.txt"), 'wb') as f: 
    f.write(PMID_List)

pastLinks = open("paperLinks.txt", 'r')

"""
for i in range(0,81):

    response = requests.get(pastLinks.readline(), allow_redirects=True)

    with open(str(PMID_List[i] + ".pdf"), 'wb') as f: 
        f.write(response.content)

    #pdfGet = requests.get(response.url)
    #with open(str(PMID_List[i] + ".pdf"),"wb") as f:
    #    f.write(pdfGet.content)
    #    f.close


    
#print(len(PMID_List))
#print(PMC_List)
"""