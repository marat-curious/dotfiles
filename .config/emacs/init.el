;;; package --- Emacs configuraiton
;;; Commentary: Configuration file

;; -*- coding: utf-8; -*-

;;; Code:

(setq gc-cons-percentage 0.5
      gc-cons-threshold (* 128 1024 1024))

(require 'package)

;; Standard package repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; ("gnu" . "https://elpa.gnu.org/packages/")
;; ("melpa-stable" . "https://stable.melpa.org/packages/")

(when (< emacs-major-version 27) (package-initialize))

(eval-and-compile
  (defsubst emacs-path (path)
    (expand-file-name path user-emacs-directory))

  (setq package-enable-at-startup nil
        load-path
        (append (list (emacs-path "use-package"))
                (delete-dups load-path)
                (list (emacs-path "lisp")))))

(require 'use-package)

(setq use-package-verbose t
      use-package-expand-minimally nil
      use-package-compute-statistics t
      debug-on-error init-file-debug
      debug-on-quit init-file-debug)

(add-hook 'after-init-hook #'garbage-collect t)

(use-package emacs
  :demand t
  :custom
  (auto-hscroll-mode 'current-line)
  (auto-save-interval 64)
  (auto-save-timeout 2)
  (create-lockfiles nil)
  (enable-recursive-minibuffers t)
  (fill-column 80)
  (history-delete-duplicates t)
  (history-length 200)
  (load-prefer-newer t)
  (menu-bar-mode nil)
  (redisplay-dont-pause t)
  (tool-bar-mode nil)
  (visible-bell t)
  (x-stretch-cursor t)

  ;; unknown
  (case-fold-search nil)
  (fast-but-imprecise-scrolling t)
  (fido-mode t)
  (mark-even-if-inactive nil)
  (use-dialog-box nil)
  (use-file-dialog nil)

  ;; startup.el
  (inhibit-startup-screen t)
  (initial-buffer-choice t)
  (initial-major-mode 'fundamental-mode)
  (initial-scratch-message "")

  ;; files.el
  (auto-save-default nil)
  (create-lockfiles nil)
  (large-file-warning-threshold nil)
  (make-backup-files nil)
  (version-control t)

  ;; paragraphs.el
  (sentence-end-double-space nil)

  ;; paren.el
  (show-paren-mode t)
  (show-paren-delay 0)

  ;; simple.el
  (backward-delete-char-untabify-method 'untabify)
  (column-number-mode t)
  (indent-tabs-mode nil)
  (kill-do-not-save-duplicates t)
  (kill-ring-max 500)
  (kill-whole-line t)
  (line-number-mode t)
  (mail-user-agent 'gnus-user-agent)
  (next-line-add-newlines nil)
  (save-interprogram-paste-before-kill t)

  ;; scroll-bar.el
  (scroll-bar-mode nil)

  :init
  (setq-default
    disabled-command-function nil
    frame-resize-pixelwise t
    window-resize-pixelwise t)

  (prefer-coding-system 'utf-8-unix)
  (set-charset-priority 'unicode)
  (set-default-coding-systems 'utf-8-unix)
  (set-keyboard-coding-system 'utf-8-unix)
  (set-language-environment "utf-8")
  (set-terminal-coding-system 'utf-8-unix)

  (setq custom-file (locate-user-emacs-file "custom.el"))
  (load-file custom-file))

(use-package personal
  :demand t
  :custom
  ;; (set-frame-font "JetBrains Mono:size=14")
  (set-frame-font "Iosevka Extended:size=16")
  (set-frame-parameter nil 'fullscreen 'maximized)
  
  :init
  (load-theme 'plain t))
