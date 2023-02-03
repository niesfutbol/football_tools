all: \
	lint \
	tests \
	coverage

define lint
	R -e "library(lintr)" \
	  -e "lint_dir('R', linters = with_defaults(line_length_linter(100)))" \
	  -e "lint_dir('tests/testthat', linters = with_defaults(line_length_linter(100)))"
endef

.PHONY: all check clean coverage linter results tests

check:
	R -e "library(styler)" \
	  -e "resumen <- style_dir('tests')" \
	  -e "resumen <- rbind(resumen, style_dir('R'))" \
	  -e "any(resumen[[2]])" \
	  | grep FALSE

clean: clean_tests
	rm --force NAMESPACE
	rm --force --recursive xGoal.Rcheck
	rm --force *.tar.gz

clean_tests:
	rm --force tests/data/cleaned_nies.csv
	rm --force tests/data/Inter_135_2022.jpg
	rm --force tests/data/predictions_78_2022_16.csv
	rm --force tests/data/strength_league_39_2022.csv
	rm --force tests/testthat/borrame_505.csv
	rm --force tests/testthat/logo.png

coverage:
	Rscript tests/testthat/coverage.R

format:
	R -e "library(styler)" \
	  -e "style_dir('R')" \
	  -e "style_dir('tests')"

linter:
	$(lint)
	$(lint) | grep -e "\^" && exit 1 || exit 0

tests:
	Rscript -e "devtools::test(stop_on_failure = TRUE)"

setup:
	R -e "devtools::document()" && \
	R CMD build . && \
	R CMD check xGoal_0.1.0.tar.gz && \
	R CMD INSTALL xGoal_0.1.0.tar.gz

