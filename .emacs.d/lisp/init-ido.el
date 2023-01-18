;; IDO mode -*- lexical-binding: t -*-

(require 'ido)
(require 'ido-completing-read+)

(ido-mode t)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(setq ido-enable-flex-matching t)

(provide 'init-ido)
