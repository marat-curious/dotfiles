;; Preferences -*- lexical-binding: t -*-

(column-number-mode 1)

(set-default-coding-systems 'utf-8)

(global-set-key [?\C-h] 'delete-backward-char)
(global-set-key [?\C-x ?h] 'help-command)

(csetq load-prefer-newer t)

(setq-default
    fill-column 80
    indent-tabs-mode nil
    tab-always-indent 'complete
    tab-width 4
    use-short-answers t)

(setq
    auto-save-default nil
    create-lockfiles nil
    make-backup-files nil
    inhibit-startup-message t
    initial-scratch-message nil
    ring-bell-function 'ignore
    transient-mark-mode t)

;; disable right to left scripts
(setq bidi-inhibit-bpa t
    bidi-paragraph-direction 'left-to-right)

(provide 'init-preferences)
