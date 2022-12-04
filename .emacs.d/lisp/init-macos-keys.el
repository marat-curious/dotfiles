;; Configure keys specific to MacOS -*- lexical-binding: t -*-

(defconst *is-a-mac* (eq system-type 'darwin))

(when *is-a-mac*
	(setq
		mac-alternate-modifier 'super
		; mac-right-alternate-modifier 'super
		mac-command-modifier 'meta
		; mac-right-command-modifier 'meta
		mac-control-modifier 'control
		; mac-right-control-modifier 'control
		mac-function-modifier 'hyper))

(provide 'init-macos-keys)
