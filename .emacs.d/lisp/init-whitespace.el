;; Whitespace mode -*- lexical-binding: t -*-

(require 'whitespace)

(global-whitespace-mode 1)

(setq whitespace-style
	  '(
		empty
		face
		indentation
		lines-tail
		newline
		space-after-tab
		space-before-tab
		spaces
		trailing
		))
(setq whitespace-display-mappings
	  '(
		(space-mark 32 [183] [46])
		(newline-mark 10 [182 10])
		(tab-mark 9 [8594 9] [92 9]) ;; 8677
		))
(setq whitespace-line-column 80)

(provide 'init-whitespace)
