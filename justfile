compile:
	rm -rf pdqrcodegen.pdx
	pdc source pdqrcodegen.pdx

simulate: compile
	killall -9 PlaydateSimulator -q || true
	PlaydateSimulator pdqrcodegen.pdx

alias run := simulate

release:
	rm -rf pdqrcodegen-release.pdx
	pdc -s source pdqrcodegen-release.pdx
	zip -r pdqrcodegen-release.pdx.zip pdqrcodegen-release.pdx
