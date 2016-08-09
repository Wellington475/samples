;; Inibe tela 'inicial', *scratch* buffer será exibido
;; (setq inhibit-startup-screen t)
(desktop-save-mode 1)
	
;; Remover a barra superior.
(when (fboundp 'tool-bar-mode)
(tool-bar-mode -1))

;; Removendo scroolbars nativas do OS, redundantes
(when (fboundp 'scroll-bar-mode)
(scroll-bar-mode -1))
	
;; Aumentar a fonte um pouco
(set-face-attribute 'default nil :height 130)
	
;; Fazer cursor parar de piscar
(blink-cursor-mode 0)

;; Mostrar o path completo para o arquivo na barra superior
(setq-default frame-title-format "%b (%f)")

;; Removendo scroolbars nativas do OS, redundantes
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Enable linum

(setq linum-mode t)

;; Remove backup files backup~ and #autosave#
;; http://goo.gl/ojcJjL

(setq make-backup-files nil)
(setq auto-save-default nil)

;; Coding 

(define-coding-system-alias 'utf8 'utf-8)

;; Package

(require 'package)
(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(unless (package-installed-p 'cider)
	(package-install 'cider))

(unless (package-installed-p 'rainbow-delimiters)
	(package-install 'rainbow-delimiters))

(unless (package-installed-p 'monokai-theme)
	(package-install 'monokai-theme))

(unless (package-installed-p 'auto-complete)
	(package-install 'auto-complete))

(if (package-installed-p 'auto-complete)
	(ac-config-default))

;; Rainbow & Clojure Hook

(if (package-installed-p 'rainbow-delimiters)
	(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))

;; Tabs & Python Hook

(add-hook 'python-mode-hook
	(lambda ()
		(setq indent-tabs-mode t)
		(setq python-indent 4)
		(setq tab-width 4)))

;; Monokai Theme

(if (package-installed-p 'monokai-theme)
	(load-theme 'monokai t))