;; Preferences -*- lexical-binding: t -*-

(column-number-mode 1)

(global-set-key [?\C-h] 'delete-backward-char)
(global-set-key [?\C-x ?h] 'help-command)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(setq
	inhibit-startup-message t
	initial-scratch-message nil
	ring-bell-function 'ignore)

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

(require 'ido)
(ido-mode t)
(ido-everywhere 1)

(provide 'init-preferences)
