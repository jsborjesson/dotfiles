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
(use-package color-theme-sanityinc-tomorrow
  :config
  (setq custom-safe-themes t)
  (color-theme-sanityinc-tomorrow-night))

;; Evil
(use-package evil
  :init
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode t)
  (define-key evil-normal-state-map (kbd "q") nil)
  (define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)
  (define-key evil-normal-state-map (kbd "Y") 'jsb/copy-to-end-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line))

(use-package evil-surround
  :config (global-evil-surround-mode t))

(use-package evil-commentary
  :diminish evil-commentary-mode
  :config (evil-commentary-mode))

(use-package evil-visualstar
  :config (global-evil-visualstar-mode))

(use-package magit
  :bind (("C-c g" . magit-status)))

(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  (define-key evil-normal-state-map (kbd "[ h") 'git-gutter:previous-hunk)
  (define-key evil-normal-state-map (kbd "] h") 'git-gutter:next-hunk))

(use-package markdown-mode)

(use-package org
  :config
  (setq org-log-done t)
  (setq org-hide-leading-stars t)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAITING(w)" "IN-PROGRESS(i)" "|" "DONE(d)")))
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "red" :weight bold))
          ("WAITING" . (:foreground "orange" :weight bold))
          ("IN-PROGRESS" . (:foreground "sky" :weight bold)))))

(use-package helm
  :diminish helm-mode
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

(use-package projectile
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :config
  (helm-projectile-on))

;; Zoom everything at once
(use-package zoom-frm
  :config
  (define-key ctl-x-map [(control ?+)] 'zoom-in/out)
  (define-key ctl-x-map [(control ?-)] 'zoom-in/out)
  (define-key ctl-x-map [(control ?=)] 'zoom-in/out)
  (define-key ctl-x-map [(control ?0)] 'zoom-in/out))

(use-package eshell
  :config
  (setq eshell-scroll-to-bottom-on-input t))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package enh-ruby-mode
  :config
  (add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode)))

(use-package helm-ag)

(use-package rust-mode)

(use-package cargo
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))


;; --- Settings ---
;; Read this file as elisp
(add-to-list 'auto-mode-alist '("emacs" . emacs-lisp-mode))

(set-face-attribute 'default nil :font "Monaco")

;; Whitespace
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq sentence-end-double-space nil)

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

;; Don't ring the bell
(setq ring-bell-function 'ignore)

;; Non-blinking cursor
(blink-cursor-mode 0)

;; Turn off wrapping by default
(setq-default truncate-lines t)

;; Start calendar on Monday
(setq calendar-week-start-day 1)

;; Automatically update changed files
(global-auto-revert-mode t)
(diminish 'auto-revert-mode)

;; Always ask y/n instead of typing out the full word
(defalias 'yes-or-no-p 'y-or-n-p)

;; Allow usage of more memory before calling GC
(setq gc-cons-threshold 20000000)

;; Turn off vc
(setq vc-handled-backends ())

;; Enable line numbers
;; (global-linum-mode t)

;; IDO mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Disable the splash screen
(setq inhibit-startup-message t
      initial-scratch-message nil)

;; Show human readable sizes in dired
(setq-default dired-listing-switches "-alh")

;; Visually indicate matching pairs of parentheses.
(show-paren-mode t)
(setq show-paren-delay 0.0)

;; --- Keybindings ---
(global-set-key (kbd "C-x 2") 'jsb/split-window-below-and-switch)
(global-set-key (kbd "C-x 3") 'jsb/split-window-right-and-switch)

;; Toggle word wrapping
(global-set-key (kbd "C-c w") 'toggle-truncate-lines)


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

(defun jsb/copy-to-end-of-line ()
  (interactive)
  (evil-yank (point) (point-at-eol)))
