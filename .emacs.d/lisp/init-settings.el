;; Settings -*- lexical-binding: t -*-

(column-number-mode 1)

(setq
	inhibit-startup-message t
	initial-scratch-message nil)

(global-whitespace-mode 1)
(setq
	whitespace-style '(
		face
		trailing
		lines-tail
		space-before-tab
		space-after-tab
		newline
		indentation
		empty
	)
	whitespace-line-column 80)

(provide 'init-settings)
