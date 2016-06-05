;; --- Setup package management ---
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Always download missing packages
(setq use-package-always-ensure t)


;; --- Install and configure packages ---
;; Set theme
(use-package solarized-theme
  :config
    (setq solarized-use-variable-pitch nil)
    (setq solarized-scale-org-headlines nil)
    (load-theme 'solarized-dark t))

;; Evil
(use-package evil
  :init 
    (setq evil-want-C-i-jump nil)
  :config
    (evil-mode t)
    (define-key evil-normal-state-map (kbd "U") 'undo-tree-redo))

(use-package evil-surround
  :config (global-evil-surround-mode t))

(use-package evil-commentary
  :config (evil-commentary-mode))

(use-package evil-visualstar
  :config (global-evil-visualstar-mode))

(use-package evil-org)

(use-package magit
  :bind (("C-c g" . magit-status)))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package org
  :config
    (setq org-log-done t)
    (setq org-hide-leading-stars t)
    (setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "IN-PROGRESS(i)" "|" "DONE(d)")))
    (setq org-todo-keyword-faces
      '(
        ("TODO" . (:foreground "red" :weight bold))
        ("WAITING" . (:foreground "orange" :weight bold))
        ("IN-PROGRESS" . (:foreground "sky" :weight bold)))))

(use-package helm
  :config
  (progn
    (require 'helm-config)
    (helm-mode t)
    (helm-autoresize-mode t)
    (setq helm-mode-fuzzy-match t)
    (setq helm-completion-in-region-fuzzy-match t)
    (setq helm-M-x-fuzzy-match t))
  :bind
  (("M-x" . helm-M-x)))

(use-package projectile)
(use-package helm-projectile
  :bind (("C-c p" . helm-projectile-find-file)))

;; --- Settings ---
;; Read this file as elisp
(add-to-list 'auto-mode-alist '("emacs" . emacs-lisp-mode))

(setq require-final-newline t)

;; Turn off ugly GUI stuff
(menu-bar-mode -1)
(if (display-graphic-p)
  (progn
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))

;; Enable Cmd key as Super(s)
(setq mac-command-modifier 'super)

;; Toggle full screen mode with Cmd-RET
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

(setq ring-bell-function 'ignore)

;; Start calendar on Monday
(setq calendar-week-start-day 1)

;; Automatically update changed files
(global-auto-revert-mode t)

;; Enable line numbers
;; (global-linum-mode t)

;; IDO mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Disable the splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; --- Keybindings ---
(global-set-key (kbd "C-x 2") 'jsb/split-window-below-and-switch)
(global-set-key (kbd "C-x 3") 'jsb/split-window-right-and-switch)


;; --- Utility functions ---
(defun jsb/split-window-below-and-switch ()
  "Split the window below, then switch to the new pane."
  (interactive)
  (split-window-below)
  (other-window 1))

(defun jsb/split-window-right-and-switch ()
  "Split the window right, then switch to the new pane."
  (interactive)
  (split-window-right)
  (other-window 1))
