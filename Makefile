.PHONY: changelog release patch

changelog:
	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

release:
	semtag final -s minor

patch:
	semtag final -s patch
