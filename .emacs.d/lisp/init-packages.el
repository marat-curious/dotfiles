;; Settings and helpers for package.el -*- lexical-binding: t -*-

(require 'package)

;; Standard package repositories
(add-to-list 'package-archives '(
	;; ("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")) t)

(setq package-enable-at-startup nil)

(unless package-archive-contents
  (package-refresh-contents))

(package-initialize)

(provide 'init-packages)
