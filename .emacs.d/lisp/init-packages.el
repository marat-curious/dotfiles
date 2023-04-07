;; Settings and helpers for package.el -*- lexical-binding: t -*-

(require 'package)

(setq package-enable-at-startup nil)

;; Standard package repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; ("gnu" . "https://elpa.gnu.org/packages/")
;; ("melpa-stable" . "https://stable.melpa.org/packages/")

(package-initialize)

(provide 'init-packages)
