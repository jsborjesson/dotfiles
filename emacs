(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq package-list
      '(
	evil
	))

(package-initialize)

(or
 (file-exists-p package-user-dir)
 (package-refresh-contents))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil)
(evil-mode t)

(require 'org)
(setq org-log-done t)

(menu-bar-mode -1)
