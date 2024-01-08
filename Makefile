.PHONY: all delete

all:
	@stow --verbose --target=$$HOME --stow */

delete:
	@stow --verbose --target=$$HOME --delete */
