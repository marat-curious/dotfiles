;; Whitespace mode -*- lexical-binding: t -*-

(require 'whitespace)

(global-whitespace-mode 1)

(setq whitespace-line-column 80)
(setq whitespace-style
      '(
        empty
        face
        indentation
        lines-tail
        newline
        newline-mark
        space-after-tab
        space-before-tab
        spaces
        space-mark
        tabs
        tab-mark
        trailing
        ))

(provide 'init-whitespace)
