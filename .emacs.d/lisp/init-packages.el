;; Settings and helpers for package.el -*- lexical-binding: t -*-

(require 'package)

(setq package-enable-at-startup nil)

;; Standard package repositories
(add-to-list 'package-archives '(
	;; ("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")) t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(provide 'init-packages)
