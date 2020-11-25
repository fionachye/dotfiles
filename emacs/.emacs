;; For emacs version older than 26.3
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Change .emacs.d/ directory accordingly
(setq user-emacs-directory "/home/fiona/.emacs.d")

;; Treat all themes as safe
(setq custom-safe-themes t)

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Disable unnecessary menus at the top
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Disable automatic backups and autosaves
(setq make-backup-files nil)
(setq auto-save-default nil)

(package-initialize)
(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(use-package org
  :ensure t)

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package powerline-evil
  :ensure t)
(powerline-evil-vim-theme)
(powerline-evil-vim-color-theme)

(use-package key-chord
  :ensure t)
(setq key-chord-two-keys-delay 0.1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(key-chord-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(org-superstar powerline-evil beacon use-package))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "dark red" :foreground "white")))))

;; Themes
;; Nord theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(use-package nord-theme
   :config
   (load-theme 'nord)
   :ensure t)

(global-hl-line-mode t) ;; This highlights the current line in the buffer
(setq-default show-trailing-whitespace t)

(use-package beacon ;; This applies a beacon effect to the highlighted line
   :ensure t
   :config
   (beacon-mode 1))

(use-package org-superstar  ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))
(setq org-startup-indented t)           ;; Indent according to section
(setq org-startup-with-inline-images t) ;; Display images in-buffer by default

;; Evil key mappings
(define-key evil-motion-state-map (kbd ":") 'evil-ex)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)
