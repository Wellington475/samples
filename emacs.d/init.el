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
  (package-install 'cider))

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(unless (package-installed-p 'monokai-theme)
  (package-install 'monokai-theme))

(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))

(unless (package-installed-p 'indent-guide)
  (package-install 'indent-guide))

(unless (package-installed-p 'multiple-cursors)
  (package-install 'multiple-cursors))

(unless (package-installed-p 'tabbar)
  (package-install 'tabbar))

(if (package-installed-p 'auto-complete)
    (ac-config-default))

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

(if (package-installed-p 'multiple-cursors)
    (require 'multiple-cursors)
  (global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-r") 'mc/mark-all-like-this))

;; Custom Emacs
 
(add-hook 'focus-out-hook
	  (lambda ()
	    (save-some-buffers t)))

(defun browse-url-firefox-search (url &optional new-window)
    (interactive "sDuck Search (GO): ") ;; http://ergoemacs.org/emacs/elisp_idioms_prompting_input.html
    (setq url (browse-url-encode-url (concat "https://duckduckgo.com/?q=" url "&ia=web")))
    (let* ((process-environment (browse-url-process-environment))
           (window-args (if (browse-url-maybe-new-window new-window)
                            (if browse-url-firefox-new-window-is-tab
                                '("-new-tab")
                              '("-new-window"))))
           (ff-args (append browse-url-firefox-arguments window-args (list url)))
           (process-name (concat "firefox " url))
           (process (apply 'start-process process-name nil
                           browse-url-firefox-program ff-args) )) ))
