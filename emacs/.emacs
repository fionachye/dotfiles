;; Change to your .emacs.d/ directory accordingly
(setq user-emacs-directory "/home/fiona/.emacs.d") 

;; Treat all themes as safe
(setq custom-safe-themes t)

;; Remove splash screen
(setq inhibit-splash-screen t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(powerline-evil beacon use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(use-package nord-theme
   :config
   (load-theme 'nord)
   :ensure t)

(global-hl-line-mode t) ;; This highlights the current line in the buffer

(use-package beacon ;; This applies a beacon effect to the highlighted line
   :ensure t
   :config
   (beacon-mode 1))

(define-key evil-motion-state-map (kbd ":") 'evil-ex)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)
(define-key evil-insert-state-map  "jk" 'evil-normal-state)

