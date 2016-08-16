;; Inibe tela 'inicial', *scratch* buffer será exibido
;; (setq inhibit-startup-screen t)
(desktop-save-mode 1)

;; Set vendor

(add-to-list 'load-path "~/.emacs.d/lisp/")
	
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

(global-linum-mode 1)

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
  (package-refresh-contents)
  (package-install 'cider))

(unless (package-installed-p 'rainbow-delimiters)
  (package-refresh-contents)
  (package-install 'rainbow-delimiters))

(unless (package-installed-p 'monokai-theme)
  (package-install 'monokai-theme))

(unless (package-installed-p 'auto-complete)
  (package-refresh-contents)
  (package-install 'auto-complete))

(unless (package-installed-p 'indent-guide)
  (package-refresh-contents)
  (package-install 'indent-guide))

(unless (package-installed-p 'multiple-cursors)
  (package-refresh-contents)
  (package-install 'multiple-cursors))

(unless (package-installed-p 'tabbar)
  (package-refresh-contents)
  (package-install 'tabbar))

(unless (package-installed-p 'web-mode)
  (package-refresh-contents)
  (package-install 'web-mode))

(unless (package-installed-p 'undo-tree)
  (package-refresh-contents)
  (package-install 'undo-tree))

;; Move Lines

(require 'move-lines)
(move-lines-binding)

;; Auto Complete

(if (package-installed-p 'auto-complete)
    (ac-config-default))

;; Web Mode - http://web-mode.org/

(if (package-installed-p 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t))

;; Rainbow & Clojure Hook

(if (package-installed-p 'rainbow-delimiters)
    (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'python-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'php-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

;; Tabs & Python Hook

(add-hook 'python-mode-hook
	  (lambda ()
	    (setq python-shell-interpreter "ipython")
	    (setq indent-tabs-mode t)
	    (setq python-indent 4)
	    (setq tab-width 4)))

;; Tabs & Html Hook

(add-hook 'web-mode-hook
    (lambda ()
      (setq indent-tabs-mode t)
      (setq tab-width 4)))

;; Monokai Theme

(if (package-installed-p 'monokai-theme)
    (load-theme 'monokai t))

;; Tabber - inspired by Amit Patel screenshot http://www.emacswiki.org/pics/static/NyanModeWithCustomBackground.png
(if (package-installed-p 'tabbar)
    (require 'tabbar)
  ;; Tabbar settings
  (set-face-attribute
   'tabbar-default nil
   :background "gray20"
   :foreground "gray20"
   :box '(:line-width 1 :color "gray20" :style nil))
  (set-face-attribute
   'tabbar-unselected nil
   :background "gray30"
   :foreground "white"
   :box '(:line-width 5 :color "gray30" :style nil))
  (set-face-attribute
   'tabbar-selected nil
   :background "gray75"
   :foreground "black"
   :box '(:line-width 5 :color "gray75" :style nil))
  (set-face-attribute
   'tabbar-highlight nil
   :background "white"
   :foreground "black"
   :underline nil
   :box '(:line-width 5 :color "white" :style nil))
  (set-face-attribute
   'tabbar-button nil
   :box '(:line-width 1 :color "gray20" :style nil))
  (set-face-attribute
   'tabbar-separator nil
   :background "gray20"
   :height 0.6)

  ;; Change padding of the tabs
  ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
  (custom-set-variables
   '(tabbar-separator (quote (0.5))))
  ;; adding spaces
  (defun tabbar-buffer-tab-label (tab)
    "Return a label for TAB.
That is, a string used to represent it on the tab bar."
    (let ((label  (if tabbar--buffer-show-groups
		      (format "[%s]  " (tabbar-tab-tabset tab))
		    (format "%s  " (tabbar-tab-value tab)))))
      ;; Unless the tab bar auto scrolls to keep the selected tab
      ;; visible, shorten the tab label to keep as many tabs as possible
      ;; in the visible area of the tab bar.
      (if tabbar-auto-scroll-flag
	  label
	(tabbar-shorten
	 label (max 1 (/ (window-width)
			 (length (tabbar-view
				  (tabbar-current-tabset)))))))))
  (global-set-key [M-left] 'tabbar-backward-tab)
  (global-set-key [M-right] 'tabbar-forward-tab))

(tabbar-mode 1)
  
;; Highlight

(if (package-installed-p 'indent-guide)
    (indent-guide-global-mode))

;; Multiple Cursos. http://goo.gl/GpC41K

(multiple-cursors-mode)
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-r") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Redo

(if (package-installed-p 'undo-tree)
  (global-undo-tree-mode 1)
  (global-set-key (kbd "M-_") 'undo-tree-redo))

;; Custom Emacs
 
(add-hook 'focus-out-hook
	  (lambda ()
	    (save-some-buffers t)))

;; Select All

(global-set-key (kbd "C-a") 'mark-whole-buffer)