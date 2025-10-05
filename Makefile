.PHONY: change
change:
	python -m http.server 8000

.PHONY: consent-and-contemporary
consent-and-contemporary:
	git aa && git cm "You lot should cease oogling the git logs and start actively supporting me instead, FFS" && git po

.PHONY: logrot
logrot:
	./src/logrot.sh

.PHONY: linkadd
addlink:
	./src/addlink.sh

.PHONY: link404
link404:
	./src/link404.sh
