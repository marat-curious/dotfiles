;; Settings and helpers for package.el -*- lexical-binding: t -*-

(require 'package)

;; Standard package repositories
(add-to-list 'package-archives '( "melpa" . "https://melpa.org/packages/") t)

(setq package-enable-at-startup nil)
(package-initialize)

(provide 'init-packages)
