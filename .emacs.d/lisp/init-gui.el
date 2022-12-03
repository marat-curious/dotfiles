;; Behaviour specific to non-TTY frames -*- lexical-binding: t -*-

(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(tool-bar-mode 0)

(set-frame-font "JetBrains Mono:size=14")
(set-frame-parameter nil 'fullscreen 'maximized)

(setq
	use-file-dialog nil
	use-dialog-box nil
	inhibit-startup-screen t)

(setq-default
	window-resize-pixelwise t
	frame-resize-pixelwise t)

(provide 'init-gui)
