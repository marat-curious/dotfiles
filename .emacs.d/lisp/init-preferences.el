;; Preferences -*- lexical-binding: t -*-

(column-number-mode 1)
(global-auto-revert-mode 1)

(set-default-coding-systems 'utf-8)

(global-set-key [?\C-h] 'delete-backward-char)
(global-set-key [?\C-x ?h] 'help-command)

(global-display-fill-column-indicator-mode)

(setq-default
    fill-column 80
    indent-tabs-mode nil
    load-prefer-newer t
    tab-always-indent 'complete
    tab-width 4
    use-short-answers t)

(setq
    auto-save-default nil
    create-lockfiles nil
    global-auto-revert-non-file-buffers t
    make-backup-files nil
    inhibit-startup-message t
    initial-scratch-message nil
    ring-bell-function 'ignore
    sentence-end-double-space nil
    transient-mark-mode t)

;; disable right to left scripts
(setq bidi-inhibit-bpa t
    bidi-paragraph-direction 'left-to-right)

(provide 'init-preferences)
