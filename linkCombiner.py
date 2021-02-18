
PMIDs = open(str("PMID_List.txt"), 'r')
links = open(str("paperLinks.txt"), 'r')


with open("combinedList.txt", 'a') as f:
    for i in range(0,81):
        f.write(links.readline())
        f.write(PMIDs.readline())
