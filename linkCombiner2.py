import requests
pdf_path = "assets/pdfs/papers"

url = 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5396460/pdf/nihms839391.pdf'

PMIDs = open(str("PMID_List.txt"), 'r')
links = open(str("paperLinks.txt"), 'r')

for i in range(0,81):
    response = requests.get(links.readline(), stream=True)
    response.raw.decode_content = True
    
    with open(str(pmid + ".pdf"), 'wb') as f:
        shutil.copyfileobj(response.raw, f)
    pmid = PMIDs.readline()
    print("paper "+ pmid)
    f.write(response.content)
