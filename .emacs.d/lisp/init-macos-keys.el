;; Configure keys specific to MacOS -*- lexical-binding: t -*-

(defconst *is-a-mac* (eq system-type 'darwin))

(when *is-a-mac*
	(setq
		mac-alternate-modifier 'meta
		; mac-right-alternate-modifier 'meta
		mac-command-modifier 'control
		; mac-right-command-modifier 'control
		mac-control-modifier 'super
		; mac-right-control-modifier 'super
		mac-function-modifier 'hyper))

(provide 'init-macos-keys)
