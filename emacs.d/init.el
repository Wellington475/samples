;; Inibe tela 'inicial', *scratch* buffer será exibido
(setq inhibit-startup-screen t)
	
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

;; ;; Packages

(require 'package)
;;(require 'rainbow-delimiters)
(add-hook 'foo-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'monokai-theme)
  (package-install 'monokai-theme))

(load-theme 'monokai t)
