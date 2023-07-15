;; IDO mode -*- lexical-binding: t -*-

(require 'ido)
(rc/require 'ido-completing-read+)

(ido-mode t)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(add-to-list 'ido-ignore-directories "node_modules")

(setq
 ido-enable-flex-matching t
 ido-use-filename-at-point 'guess)

(require 'icomplete)
(icomplete-mode 1)

(provide 'init-ido)
