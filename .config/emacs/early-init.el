;;; early-init.el --- Early initialization -*- lexical-binding: t; no-byte-compile: t -*-

;; Keywords: Emacs configuration
;; Homepage: https://github.com/marat-curious/dotfiles.git
;; Example: https://gitlab.com/andreyorst/dotfiles.git

;;; Commentary:
;; Emacs 30+ early initialization configuration.

;;; Code:

(setq gc-cons-threshold (* 2 gc-cons-threshold))

(let ((original-gc-cons-threshold gc-cons-threshold))
  (setq
   gc-cons-threshold most-positive-fixnum
   inhibit-compacting-font-caches t
   message-log-max 16384
   package-enable-at-startup nil
   load-prefer-newer noninteractive)
  (add hook 'emacs-startup-hook
    (lambda nil
      (setq gc-cons-threshold original-gc-cons-threshold))))

(unless (or (daemonp) noninteractive)
  (when (fboundp #'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp #'scroll-bar-mode)
    (scroll-bar-mode -1)))

(when (featurep 'native-compile)
  (defvar native-comp-async-report-warnings-errors)
  (setq native-comp-async-report-warnings-errors 'silent))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/"))
(package-initialize)

(add-hook 'after-init-hook #'garbage-collect t)

(provide 'early-init)
;;; early-init.el ends here
