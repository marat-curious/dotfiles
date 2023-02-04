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
        space-after-tab
        space-before-tab
        spaces
        trailing
        ))

(add-to-list 'whitespace-style 'newline-mark)
(add-to-list 'whitespace-style 'space-mark)
(add-to-list 'whitespace-style 'tab-mark)

(provide 'init-whitespace)
