# Reads assets/pubmed_result.xml, and turns into paper .md
# For each entry, create a new file and add information to it

require 'nokogiri'

xml = File.open("assets/pubmed_result.xml") { |f| Nokogiri::XML(f) }
xml.xpath('//PubmedArticle').each do |article|
	
	file_name = article.xpath('MedlineCitation/DateCreated/Year').text + "-" + article.xpath('MedlineCitation/DateCreated/Month').text + "-" + article.xpath('MedlineCitation/DateCreated/Day').text + "-" + article.xpath('PubmedData/ArticleIdList/ArticleId[@IdType="pubmed"]').text
	
	file = File.new("papers/_posts/" + file_name + ".md", "w")
	
	# Pull all other required data from assets/pubmed_result.xml

	file.puts("---")
	file.puts("layout: paper")
	file.puts("title: " + "\"" + article.xpath('MedlineCitation/Article/ArticleTitle').text + "\"")
	file.puts("image: /assets/images/papers/" + article.xpath('PubmedData/ArticleIdList/ArticleId[@IdType="pubmed"]').text + ".png")

	file.print("authors: ")
	authors = article.xpath('MedlineCitation/Article/AuthorList/Author')
	
	authors.each do |author|
		file.print(author.xpath('ForeName').text + " " + author.xpath('LastName').text)
		
		if !author.xpath('ForeName').text.eql?(authors.last.xpath('ForeName').text) then file.print(", ") end
	end
	
	file.puts("")

	file.puts("year: " + article.xpath('MedlineCitation/Article/Journal/JournalIssue/PubDate/Year').text)
	file.puts("ref: " + article.xpath('MedlineCitation/Article/AuthorList/Author/LastName')[0].text + " et al. " + article.xpath('MedlineCitation/Article/Journal/JournalIssue/PubDate/Year').text + ". " + article.xpath('MedlineCitation/Article/Journal/ISOAbbreviation').text + ".")
	if article.at_xpath('MedlineCitation/Article/Journal/JournalIssue/Volume') then
		file.puts("journal: " + "\"" + article.xpath('MedlineCitation/Article/Journal/Title').text + " " + "<b>" + article.xpath('MedlineCitation/Article/Journal/JournalIssue/Volume').text + "</b>" + ", " + article.xpath('MedlineCitation/Article/Pagination/MedlinePgn').text + "\"")
	else
		file.puts("journal: " + "\"" + article.xpath('MedlineCitation/Article/Journal/Title').text + " " + article.xpath('MedlineCitation/Article/Pagination/MedlinePgn').text + "\"")
	end
	file.puts("pdf: /assets/pdfs/papers/" + article.xpath('PubmedData/ArticleIdList/ArticleId[@IdType="pubmed"]').text + ".pdf")
	file.puts("doi: " + article.xpath('PubmedData/ArticleIdList/ArticleId[@IdType="doi"]').text)
	file.puts("---")
	file.puts("")
	if article.at_xpath('MedlineCitation/Article/Abstract/AbstractText') then
		file.puts("# Abstract")
		file.puts("")
		
		abstracts = article.xpath('MedlineCitation/Article/Abstract/AbstractText')
		abstracts.each do |abstract|
			file.puts(abstract.text)
			file.puts("")	
		end
	end

	file.close
end