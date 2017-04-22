all: CaseStudy2.html

clean: 
	rm -f CaseStudy2.html CaseStudy2.html

CaseStudy2.html: CaseStudy2.Rmd
	Rscript -e 'rmarkdown::render("$<")'