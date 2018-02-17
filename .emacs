;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
 '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (evil pdf-tools slime markdown-mode org-edna exwm xelb)))
 '(shell-switcher-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Mono" :foundry "GOOG" :slant normal :weight normal :height 98 :width normal))))
 '(term-color-blue ((t (:background "cornflower blue" :foreground "cornflower blue"))))
 '(term-color-green ((t (:background "lime green" :foreground "lime green"))))
 '(term-color-yellow ((t (:background "orange1" :foreground "orange1")))))
(load "~/q-mode/q-mode.el")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/shell-switcher/")
(add-to-list 'auto-mode-alist '("\\.[kq]\\'" . q-mode))
(require 'exwm)
(require 'exwm-config)
(require 'powerline)
;; multi-term
;;(require 'multi-term)
;;(setq multi-term-program "/bin/bash")
;; shell-switcher
(require 'shell-switcher)
(defun make-bash () "Create new bash term" (ansi-term "/bin/bash" (generate-new-buffer-name "ansi-term")))
(setq-default shell-switcher-new-shell-function 'make-bash)
;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                    (concat "~/.backups")))))
;; Don't clutter with #files either
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name (concat "~/.backups")))))
(setq inferior-lisp-program "/usr/bin/sbcl")
(exwm-enable)
(exwm-config-default)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(powerline-default-theme)
