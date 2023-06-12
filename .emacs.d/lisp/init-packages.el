;; Settings and helpers for package.el -*- lexical-binding: t -*-

(require 'package)

;; Standard package repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; ("gnu" . "https://elpa.gnu.org/packages/")
;; ("melpa-stable" . "https://stable.melpa.org/packages/")

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(when init-file-debug
  (setq use-package-verbose t
        use-package-expand-minimally nil
        use-package-compute-statistics t
        debug-on-error t))

(provide 'init-packages)
