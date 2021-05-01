;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Set default directory
(setq default-directory (expand-file-name "~/org-notes"))

;; Change .emacs.d/ directory accordingly
(setq user-emacs-directory (expand-file-name "~/.emacs.d"))

;; Set path of custom file
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file)

;; Set path for custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Treat all themes as safe
(setq custom-safe-themes t)

;; Load theme
(load-theme 'nord t)

;; Remove splash screen and unnecessary menus
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Display line and column number
(global-display-line-numbers-mode)
(column-number-mode 1)

;; Disable automatic backups and autosaves
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Echo keystrokes after 0.1 seconds
(setq echo-keystrokes 0.1)

(package-initialize)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(use-package org
  :ensure t)
(use-package plantuml-mode
  :ensure t)
(use-package dash  ;; Required by org-inline-image-animate
  :ensure t)
(use-package async ;; Required by org-image-download
  :ensure t)
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(use-package undo-fu
  :ensure t
  :config
  (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))
(use-package powerline-evil
  :ensure t
  :config
  (powerline-evil-vim-theme)
  (powerline-evil-vim-color-theme))
(use-package key-chord
  :ensure t
  :config
  (setq key-chord-two-keys-delay 0.1)
  (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
  (key-chord-mode 1))
(use-package beacon ;; This applies a beacon effect to the highlighted line
   :ensure t
   :config
   (beacon-mode 1))
(use-package org-superstar  ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;; Load lisp files
(load "~/.emacs.d/lisp/org-download")
(load "~/.emacs.d/lisp/org-inline-image")

;; Common Lisp Environment
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup '(slime-fancy))

;; Basic Editor Settings
(setq-default show-trailing-whitespace t)
(global-hl-line-mode t) ;; This highlights the current line in the buffer

;; Org Mode Settings
(setq org-startup-indented t)           ;; Indent according to section
(setq org-startup-with-inline-images t) ;; Display images in-buffer by default
(setq org-hide-emphasis-markers t)      ;; Hide emphasis markers, like asterisks besides a bolded font
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml.jar"))  ;; Location of plantuml jar file
(org-babel-do-load-languages            ;; Enable these languages for org-babel
  'org-babel-load-languages
  '((python . t)
    (js . t)
    (plantuml . t)
    (lisp . t)
    ))
(customize-set-variable 'org-download-image-dir "screenshots")  ;; Location of screen clips relative to current file
(customize-set-variable 'org-download-heading-lvl nil)

;; plantuml major mode settings
;; To download the latest jar, do M-x plantuml-download-jar
(setq plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml.jar"))  ; Location of jar file for plantuml mode, this is different from the org mode one
(setq plantuml-default-exec-mode 'jar)

;; Evil key mappings
(define-key evil-motion-state-map (kbd ":") 'evil-ex)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)
